const dayjs = require('dayjs')

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
      }, 15000)

      res.json({ status: "ok" })
    }catch(error){
      console.log(error)
      return next(new ServiceUnavailableException(error.message));
    }
  })

}