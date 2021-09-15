import { createStore } from 'vuex'
import { REST } from '../libs/query'
import { nanoid } from 'nanoid'
import { STAND_ID } from '../constants'

const pageStore = createStore ({
  state() {
    const params = new URLSearchParams(window.location.search)

    return {
      page: "start",
      photoId: "",
      id: params.get("id") || nanoid(),
      message: null
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
    }
  },
  actions: {
    async photo (){
      const resp = await REST("/api/photo", { user_id: this.state.id, stand_id: STAND_ID } )

      if(resp.status === "ok")
        this.commit("setPage", "photo")
      else
        this.dispatch("message", "Стенд в данное время уже используется")
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
      }, 2000)
    }
  }
})

export default pageStore