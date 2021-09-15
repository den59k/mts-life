module.exports = function registerEndpoint(router, { services, exceptions }) {
	const { ItemsService } = services;
	const { ServiceUnavailableException } = exceptions;

  router.get('/launch', async (req, res, next) => {

		const standService = new ItemsService('stands', req);

    const data = await standService.readByQuery({ fields: ['name', 'actors.*'] })
    res.json(data)
	});

  router.get("/stands/:stand_id", async (req, res, next) => {
    const { stand_id } = req.params
    
    try{
      const standService = new ItemsService('stands', req);

      const standInfo = await standService.readOne(stand_id, { fields: [ 'status', 'active', 'photo' ] })
      if(!standInfo) return res.json({ error: "wrong stand_id" })

      res.json({ status: standInfo.status, photo: standInfo.photo })
    }catch(error){
      return next(new ServiceUnavailableException(error.message));
    }
  })

  router.post("/photo", async (req, res, next) => {
    const { stand_id, user_id } = req.body
    try{
      const standService = new ItemsService('stands', req)
      const photoService = new ItemsService('photos', req)
      const standInfo = await standService.readOne(stand_id, { fields: [ 'status', 'active' ] })
      if(!standInfo) return res.json({ error: "wrong stand_id" })
      if(standInfo.status !== "available")
        return res.json({ status: "busy" })
      
      const photoKey = await photoService.createOne({ user_id, stand_id })

      await standService.updateOne(stand_id, { status: "photo", photo: photoKey })

      const timeout = setTimeout(async () => {
        await standService.updateOne(stand_id, { status: "available" })
        if(!res.headersSent)
          res.status(404).json({ status: "non-active" })
      }, 5000)

      global.actions.set(stand_id.toString(), () => {
        clearTimeout(timeout)
        res.json({ photo: photoKey, status: "ok" })
      })

      
    }catch(error){
      console.log(error)
      return next(new ServiceUnavailableException(error.message));
    }
  })
  
  router.post("/launch", async (req, res, next) => {
    
    const { stand_id, user_id } = req.body
    try{
      const standService = new ItemsService('stands', { schema: req.schema, accountability: req.accountability });
      const standInfo = await standService.readOne(stand_id, { fields: [ 'status', 'active' ] })
      if(!standInfo) return res.json({ error: "wrong stand_id" })
      if(!standInfo.active)
        return res.json({ status: "busy" })

      //await standService.updateOne(stand_id, { user_id, status: "welcome" })

      res.json({ status: "ok" })
    }catch(error){
      return next(new ServiceUnavailableException(error.message));
    }
  })
};