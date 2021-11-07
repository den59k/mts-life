const alerts = {
  namespaced: true,
  state () {
    return {
      text: null,
      timeout: null,
    }
  },
  mutations: {
    setAlert: (state, alert) => state.text = alert,
    setTimeout: (state, timeout) => state.timeout = timeout
  },
  actions: {
    alert({ commit, state }, str){
      commit("setAlert", str)
      
      clearTimeout(state.timeout)
      const timeout = setTimeout(() => {
        commit("setAlert", null)
      }, 5000)
      commit("setTimeout", timeout)
    }
  }
}

export default alerts