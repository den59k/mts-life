import { REST } from '../libs/query'
import { STAND_ID } from '../libs/constants'
import { nanoid } from 'nanoid'
import fileDownload from 'js-file-download'

const mts = {
  namespaced: true,
  state () {
    const params = new URLSearchParams(window.location.search)
    window.localStorage.removeItem("attempts")
    const attempts = window.localStorage.getItem("attempts")
    
    return {
      user_id: params.get("id") || nanoid(),
      stand_id: parseInt(params.get("stand_id")) || STAND_ID,
      attempts: typeof attempts === "number"? attempts: 2,
      standData: null,
      photo: null
    }
  },
  getters: {
    url: state => "/api/stands/"+state.stand_id
  },
  mutations: {
    setStandData: (state, standData) => state.standData = standData,
    setScenario: (state, scenario) => state.scenario = scenario,
    setPhoto: (state, photoSrc) => state.photo = photoSrc
  },
  actions: {
    async launch({ state, commit, getters }){
      const data = await REST(getters.url+"/launch", { user_id: state.user_id })
      if(data.error) return data
      commit("setStandData", data)
      return data
    },
    async changeScenario({ commit, getters, state }, scenario){
      commit("setScenario", scenario)
      await REST(getters.url+"/scenario", { user_id: state.user_id, scenario })
    },
    async makePhoto({ state, getters, commit, dispatch }){
      const resp = await REST(getters.url+"/photo", { user_id: state.user_id, scenario: state.scenario })
      
      if(resp.status == 'ok')
        commit("pages/setPage", "photo", { root: true })
      if(resp.status === "busy")
        dispatch("alerts/alert", "Фотозона в данное время уже используется", { root: true })
      if(resp.status === "non-active")
        dispatch("alerts/alert", "Извините, фотозона в данное время не активна", { root: true })
    },
    async makePhotoAgain({ commit }){
      commit("pages/setPage", "start", { root: true })
    },
    async savePhoto({ state, dispatch }){
      const image = await fetch(`${state.photo}`)
      const imageBlob = await image.blob()
      //const imageURL = URL.createObjectURL(imageBlog)

      fileDownload(imageBlob, 'photo.jpg', 'image/jpeg')

      await new Promise(res => setTimeout(res, 200))

      dispatch("exitApp")
    },
    async exitApp({ commit }){
      commit("pages/setPage", "exit", { root: true })
    }
  }
}

export default mts