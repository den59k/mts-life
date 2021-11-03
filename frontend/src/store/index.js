import { createStore } from 'vuex'
import { REST } from '../libs/query'
import { STAND_ID } from '../libs/constants'
import { nanoid } from 'nanoid'

const store = createStore({
  state(){

    const params = new URLSearchParams(window.location.search)
    window.localStorage.removeItem("attempts")
    const attempts = window.localStorage.getItem("attempts")
    
    return {
      page: "start",
      user_id: params.get("id") || nanoid(),
      stand_id: parseInt(params.get("stand_id")) || STAND_ID,
      attempts: typeof attempts === "number"? attempts: 2,
      standData: null,
      alertText: null
    }
  },
  getters: {
    url: state => "/api/stands/"+state.stand_id
  },
  mutations: {
    setPage: (state, pageName) => state.page = pageName,
    setAlert: (state, alert) => state.alert = alert,
    setStandData: (state, standData) => state.standData = standData,
    setScenario: (state, scenario) => state.scenario = scenario
  },
  actions: {
    async launch(){
      const data = await REST(this.getters.url+"/launch", { user_id: this.state.user_id })
      if(data.error) return data
      this.commit("setStandData", data)
      return data
    },
    async changeScenario(_, scenario){
      this.commit("setScenario", scenario)
      await REST(this.getters.url+"/scenario", { user_id: this.state.user_id, scenario })
    },
    async makePhoto(){
      const resp = await REST(this.getters.url+"/photo", { user_id: this.state.user_id, scenario: this.state.scenario })

      if(resp.status == 'ok')
        this.commit("setPage", "photo")
      if(resp.status === "busy")
        this.dispatch("message", "Фотозона в данное время уже используется")
      if(resp.status === "non-active")
        this.dispatch("message", "Извините, фотозона в данное время не активна")
    },
    async alert(_, str){
      this.commit("setAlert", str)
      await new Promise(res => setTimeout(res, 3000))
      this.commit("setAlert", null)
    }
  }
})

export default store