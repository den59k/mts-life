import { createStore } from 'vuex'
import { REST } from '../libs/query'
import { nanoid } from 'nanoid'
import { STAND_ID } from '../constants'

const pageStore = createStore ({
  state() {
    const params = new URLSearchParams(window.location.search)
    window.localStorage.removeItem("attempts")
    const attempts = window.localStorage.getItem("attempts")
    
    return {
      page: "start",
      photoId: "",
      id: params.get("id") || nanoid(),
      message: null,
      canPhoto: true,
      attempts: typeof attempts === "number"? attempts: 2,
      standId: parseInt(params.get("stand_id")) || STAND_ID
    }
  },
  mutations: {
    setPage (state, pageName) {
      state.page = pageName
    },
    setPhotoId (state, photoId) {
      state.photoId = photoId
    },
    setMessage(state, text) {
      state.message = text
    },
    setCanPhoto(state, canPhoto){
      state.canPhoto = canPhoto
    },
    makeAttempt(state){
      state.attempts--;
      window.localStorage.setItem("attempts", state.attempts)
    },
    clearAttempts(state){
      state.attempts = 3;
      window.localStorage.setItem("attempts", state.attempts)
    }
  },
  actions: {
    async photo (){
      this.commit("setCanPhoto", false)
      const resp = await REST("/api/photo", { user_id: this.state.id, stand_id: this.state.standId } )
      this.commit("setCanPhoto", true)

      if(resp.status === "ok")
        this.commit("setPage", "photo")
      if(resp.status === "busy")
        this.dispatch("message", "Фотозона в данное время уже используется")
      if(resp.status === "non-active")
        this.dispatch("message", "Извините, фотозона в данное время не активна")
    },
    exitApp() {
      console.log("exit app...")
      this.commit("setPage", "exit")
      window.location.assign("#exit")
    },
    message(_, text) {
      this.commit("setMessage", text)
      
      if(this.messageTimeout) clearTimeout(this.messageTimeout)
      this.messageTimeout = setTimeout(() => {
        this.commit("setMessage", null)
      }, 3500)
    },
    makeAnotherPhoto(){
      this.commit("setPage", "start")
      this.commit("makeAttempt");
    }
  }
})

export default pageStore