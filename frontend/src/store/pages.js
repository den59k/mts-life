const pages = {
  namespaced: true,
  state () {
    return {
      page: "start"
    }
  },
  mutations: {
    setPage: (state, pageName) => state.page = pageName,
  },
}

export default pages