module.exports = function registerEndpoint(router, { services, exceptions }) {
	const { ItemsService } = services;
	const { ServiceUnavailableException } = exceptions;

  router.post("/stands/:stand_id/launch", async (req, res, next) => {

    const { stand_id } = req.params
    const { user_id } = req.body

    try{
      const standService = new ItemsService('stands', req);
      
      const standInfo = await standService.readOne(stand_id, { 
        fields: [ 'status', 'active', 'photo', 'scenarios.scenarios_id.*', 'selected_scenario' ] 
      })
      if(!standInfo) return res.json({ error: "wrong stand_id" })
      
      await standService.updateOne(stand_id, { user_id })

      res.json({ 
        status: standInfo.status, 
        photo: standInfo.photo, 
        scenarios: standInfo.scenarios.map(i => i.scenarios_id) ,
        selected_scenario: standInfo.selected_scenario
      })
    }catch(error){
      console.log(error)
      return next(new ServiceUnavailableException(error.message));
    }
	});

  router.post("/stands/:stand_id/scenario", async(req, res, next) => {

    const { stand_id } = req.params
    const { user_id, scenario } = req.body

    try{
      const standService = new ItemsService('stands', req);
      const standInfo = await standService.readOne(stand_id, { 
        fields: [ 'user_id', 'status' ] 
      })

      if(!standInfo) return res.json({ error: "wrong stand_id" })
      if(standInfo.user_id != user_id) return res.json({ error: "busy" })
      if(standInfo.status !== "available") return res.json({ error: "on photo screen" })
 
      await standService.updateOne(stand_id, { selected_scenario: scenario })

      res.json({ status: "ok" })
    }catch(error){
      res.json({ error: "failed" })
      //return next(new ServiceUnavailableException(error.message));
    }
  })


  router.post("/stands/:stand_id/photo", async (req, res, next) => {
    const { stand_id } = req.params
    const { user_id, scenario } = req.body
    try{
      const standService = new ItemsService('stands', req)
      const photoService = new ItemsService('photos', req)
      const standInfo = await standService.readOne(stand_id, { fields: [ 'status', 'active' ] })
      if(!standInfo) return res.json({ error: "wrong stand_id" })
      if(standInfo.status !== "available")
        return res.json({ status: "busy" })
      
      const photoKey = await photoService.createOne({ user_id, stand_id })

      await standService.updateOne(stand_id, { status: "photo", photo: photoKey, selected_scenario: scenario, user_id })

      const timeout = setTimeout(async () => {
        await standService.updateOne(stand_id, { status: "available" })
        global.actions.set(stand_id.toString(), null)
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
  
  //deprecated routers
  router.get("/stands/:stand_id", async (req, res, next) => {
    const { stand_id } = req.params
    
    try{
      const standService = new ItemsService('stands', req);

      const standInfo = await standService.readOne(stand_id, { 
        fields: [ 'status', 'active', 'photo', 'scenarios.scenarios_id.*', 'selected_scenario' ] 
      })
      if(!standInfo) return res.json({ error: "wrong stand_id" })
      res.json({ 
        status: standInfo.status, 
        photo: standInfo.photo, 
        scenarios: standInfo.scenarios.map(i => i.scenarios_id) ,
        selected_scenario: standInfo.selected_scenario
      })
    }catch(error){
      return next(new ServiceUnavailableException(error.message));
    }
  })

};