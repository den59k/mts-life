module.exports = function registerEndpoint(router, { services, exceptions }) {
	const { ItemsService } = services;
	const { ServiceUnavailableException } = exceptions;

  router.post('/', (req, res) => {
    res.json({ hello: "world" })
  })

	router.get('/', (req, res, next) => {
    console.log(services)
		res.json({ hello: "world" })
	});
};