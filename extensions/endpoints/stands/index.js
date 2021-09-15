global.actions = new Map()

module.exports = function registerEndpoint(router, { services, exceptions, getSchema }) {
	const { ItemsService, FilesService } = services;
	const { ServiceUnavailableException } = exceptions;
  
  router.get("/:stand_id", async (req, res, next) => {

    const { stand_id } = req.params
    const standService = new ItemsService('stands', req);
    
    try{
      const standInfo = await standService.readOne(stand_id, { fields: [ 'status', 'active', 'photo' ] })
      if(!standInfo) return res.json({ error: "wrong stand_id" })

      if(global.actions.get(stand_id)){
        global.actions.get(stand_id)()
        global.actions.set(stand_id, null)
      }
      
      res.json({ status: standInfo.status, photo: standInfo.photo })
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
    const standService = new ItemsService('stands', req);
    try{
      const standInfo = await standService.readOne(stand_id, { fields: [ 'status', 'active', 'photo' ] })
      if(!standInfo) return res.status(404).json({ error: "wrong stand_id" })
      if(!standInfo.photo) return res.status(403).json({ error: "stand hasnt photo" })
      
      await photoService.updateOne(standInfo.photo, { file: { id } })
      await standService.updateOne(stand_id, { status: "final" })

      setTimeout(async () => {
        await standService.updateOne(stand_id, { status: "available" })
      }, 5000)

      res.json({ status: "ok" })
    }catch(error){
      console.log(error)
      return next(new ServiceUnavailableException(error.message));
    }
  })

}