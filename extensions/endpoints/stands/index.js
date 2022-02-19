const dayjs = require('dayjs')
const customParseFormat = require('dayjs/plugin/customParseFormat')
const weekOfYear = require('dayjs/plugin/weekOfYear')
const csv = require('fast-csv');
const fs = require('fs')
dayjs.extend(customParseFormat)
dayjs.extend(weekOfYear)

global.actions = new Map()

module.exports = function registerEndpoint(router, { services, exceptions, getSchema }) {
	const { ItemsService, MailService } = services;
	const { ServiceUnavailableException } = exceptions;

  const timeouts = new Map();

  let mailService;
  getSchema().then(schema => {
    mailService = new MailService({ schema })
  });
  
  router.get("/:stand_id", async (req, res, next) => {

    const { stand_id } = req.params
    const standService = new ItemsService('stands', req);
    
    try{
      const standInfo = await standService.readOne(stand_id, { fields: [ 'status', 'active', 'photo', 'selected_scenario' ] })
      if(!standInfo) return res.json({ error: "wrong stand_id" })

      if(global.actions.get(stand_id)){
        global.actions.get(stand_id)()
        global.actions.set(stand_id, null)
      }

      res.json({ status: standInfo.status, photo: standInfo.photo, scenario: standInfo.selected_scenario })
    }catch(error){
      console.log(error)
      return next(new ServiceUnavailableException(error.message));
    }
  })

  router.post("/:stand_id/activity", async (req, res, next) => {
    const { stand_id } = req.params
    const standService = new ItemsService('stands', req)

    if(timeouts.has(stand_id)){
      clearTimeout(timeouts.get(stand_id))
      timeouts.delete(stand_id)
    }

    try{
      const firstStandInfo = await standService.readOne(stand_id, { fields: [ 'last_activity', 'log_email', 'day_photo_count' ] })
      const { last_activity, log_email, day_photo_count } = firstStandInfo

      const nowDate = dayjs();

      await standService.updateOne(stand_id, { last_activity: nowDate.format() })

      if(nowDate.isAfter(dayjs(last_activity), 'days')){
        console.log(`${dayjs(last_activity).format('DD.MM.YYYY H:mm')}. Stand ${stand_id} PHOTO LOG: ${day_photo_count}`)
        await standService.updateOne(stand_id, { day_photo_count: 0 })
        if(log_email){
          await mailService.send({
            to: log_email,
            subject: `Количество фото за ${dayjs(last_activity).format('DD.MM.YYYY')} на стенде ${stand_id}`,
            html: `За ${dayjs(last_activity).format('DD.MM.YYYY')} на стенде ${stand_id} было сделано <b>${day_photo_count} фото</b>.`
          })
        }
      }

      const timeout = setTimeout(async () => {
        const standInfo = await standService.readOne(stand_id, { fields: [ 'last_activity' ] })

        if(!dayjs(standInfo.last_activity).isAfter(nowDate), 'seconds'){
          console.log(`ATTENTION! STAND ${stand_id} IS NOT ACTIVE!`);
          if(!log_email) return
          
          await mailService.send({
            to: log_email,
            subject: `Работоспособность стенда ${stand_id}`,
            html: `<h2>Обратите внимание!</h2>
            Стойка ${stand_id} сейчас не работает!<br/>
            Последняя активность была в <b>${dayjs(last_activity).format('H:mm')}</b>`
          })
        
        }
      }, 30 * 1000 * 60)

      if(timeouts.has(stand_id)){
        clearTimeout(timeouts.get(stand_id))
        timeouts.delete(stand_id)
      }
      timeouts.set(stand_id, timeout)
      res.json({ status: "updated" })
    }catch(error){
      console.log(error)
      return next(new ServiceUnavailableException(error.message));
    }
  })

  router.post("/:stand_id/upload", async (req, res, next) => {

    const { stand_id } = req.params
    const { data } = req.body
    const { id } = data
    
    const photoService = new ItemsService('photos', req)
    const standService = new ItemsService('stands', req)
    try{
      const standInfo = await standService.readOne(stand_id, { fields: [ 'status', 'active', 'photo', 'day_photo_count' ] })
      if(!standInfo) return res.status(404).json({ error: "wrong stand_id" })
      if(!standInfo.photo) return res.status(403).json({ error: "stand hasnt photo" })
      
      await photoService.updateOne(standInfo.photo, { file: { id } })
      const photo_count = standInfo.day_photo_count+1;
      await standService.updateOne(stand_id, { status: "final", day_photo_count: photo_count })

      setTimeout(async () => {
        await standService.updateOne(stand_id, { status: "available", selected_scenario: "" })
      }, 10000)

      res.json({ status: "ok" })
    }catch(error){
      console.log(error)
      return next(new ServiceUnavailableException(error.message));
    }
  })

  router.get("/:stand_id/stats", async (req, res) => {

    const { stand_id } = req.params
    const { days, start, end } = req.query
    const group = req.query.group || "advanced"

    const filter = { }
    if (stand_id != "-1") {
      if (stand_id.includes(",")) {
        filter.stand_id = { _in: stand_id.split(",").map(st => parseInt(st)).filter(i => !isNaN(i)) }
      } else {
        if (!parseInt(stand_id)) {
          return res.send({ error: "stand_id is not int"})
        }
        filter.stand_id = { _eq: parseInt(stand_id) } 
      }
    }

    if (end) {
      filter.date_created._lte = dayjs(end, "DD.MM.YYYY").toISOString()
    } else {
      filter.date_created = { _lte: new Date().toISOString() }
    }

    if (start) {
      filter.date_created._gte = dayjs(start, "DD.MM.YYYY").toISOString()
    }
    if (days) {
      filter.date_created._gte = dayjs(filter.date_created._lte).subtract(days, "day").toISOString()
    }
    
    if (filter.date_created._gte && filter.date_created._lte) {
      filter.date_created = { _between: [ filter.date_created._gte, filter.date_created._lte ] }
    }

    const schema = await getSchema()
    const photoService = new ItemsService('photos', { schema })
    const standService = new ItemsService('stands', { schema })

    const _stands = await standService.readByQuery({
      fields: [ "id", "name" ]
    })
    
    const stands = []
    for (let stand of _stands){ 
      stands[stand.id] = stand
    }

    const rows = []     
    let lastDate = null

    if (group === "advanced") {

      const resp = await photoService.readByQuery({ 
        fields: [ 'id', 'file.filename_disk', 'date_created', 'user_id', 'stand_id' ], 
        filter,
        sort: [ 'id' ],
        limit: -1
      })

      rows.push([ 'ID', 'Stand', 'Date', 'Time', 'User ID' ])

      for (let item of resp) {
        const date = dayjs(item.date_created)
        rows.push([
          item.id,
          stands[item.stand_id].name,
          date.format('DD.MM.YYYY'),
          date.format('HH:mm'),
          item.user_id
        ])
      }
    } else {

      let _group = [ "year(date_created)", "month(date_created)",  "stand_id" ]

      if (group === "day") {
        _group = [ "year(date_created)", "month(date_created)", "day(date_created)",  "stand_id" ]
      }

      if (group === "week") {
        _group = [ "year(date_created)", "month(date_created)", "week(date_created)",  "stand_id" ]
      }

      const photos = await photoService.readByQuery({ 
        aggregate: {
          count: [ "*" ],
          countDistinct: [ "user_id" ],
        },
        group: _group,
        filter,
        limit: -1
      })

      const firstDay = dayjs().set("day", 0)

      rows.push([ "Stand", "Photos", "Users" ])

      for (let item of photos) {
        // const date = dayjs(item.date_created)
        let date = item.date_created_year + "." + item.date_created_month
        if (group === "week") date = date + "." + item.date_created_week
        if (group === "day") date = date + "." + item.date_created_day

        if (date !== lastDate) {
          if (group === "week") {
            rows.push([ 
              firstDay.year(item.date_created_year).week(parseInt(item.date_created_week)+1).format("DD.MM.YYYY") + "-" + 
              firstDay.year(item.date_created_year).week(parseInt(item.date_created_week)+1).day(6).format("DD.MM.YYYY"),"" 
            ])
          }
          if (group === "day") {
            rows.push([
              firstDay.year(item.date_created_year).month(parseInt(item.date_created_month)-1).date(item.date_created_day).format("DD.MM.YYYY")
            ])
          }

          if (group === "month") {
            rows.push([ 
              firstDay.year(item.date_created_year).month(parseInt(item.date_created_month)-1).date(1).format("DD.MM.YYYY") + "-" + 
              firstDay.year(item.date_created_year).month(parseInt(item.date_created_month)).date(0).format("DD.MM.YYYY"),"" 
            ])
          }
        }
        rows.push([
          stands[item.stand_id].name,
          item.count,
          item.countDistinct.user_id
        ])
        lastDate = date
      }
    }

    const buffer = await csv.writeToBuffer(rows, {
      delimiter: ";"
    })
    
    res.set({ 'Content-Type': 'text/csv' })
    res.send(buffer)
  })

}