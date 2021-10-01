<template>
  <div :class="['layout', page]">
    <StartPage v-if="page === 'start'" :canPhoto="$store.state.canPhoto"/>
    <PhotoPage v-if="page === 'photo'"/>
    <FinalPage v-if="page === 'final'"/>
    <ExitPage v-if="page === 'exit'" />
  </div>
  <div class="layout-message">
    <transition name="fade">
      <div v-if="$store.state.message" class="popup-message">
        {{ $store.state.message }}
      </div>
    </transition>
  </div>
</template>

<script>

import StartPage from './pages/start-page'
import PhotoPage from './pages/photo-page'
import FinalPage from './pages/final-page'
import ExitPage from './pages/exit-page'
import { GET } from './libs/query'
import { STAND_ID } from './constants'

export default {
  name: 'App',
  components: {
    StartPage,
    PhotoPage,
    FinalPage,
    ExitPage
  },
  data() {
    return {
      canPhoto: false
    }
  },
  created() {
    this.fetchData()
  },
  computed: {
    page: {
      get() {
        return this.$store.state.page
      }
    }
  },
  methods: {
    async fetchData() {
      console.log(this.$store.state )
      const stand = await GET("/items/stands/"+STAND_ID, { "fields[]": "*" })
      
      if(stand.status)
        this.canPhoto = true
    }
  }
}
</script>

<style lang="sass">
@import './styles/styles'
@import './styles/animations'

.layout
  display: flex
  flex-direction: column
  min-height: 100vh
  max-width: 400px
  margin: 0 auto
  padding: 0 2em

  @media(max-width: 300px)
    padding: 0 1em

  &.final
    background-color: white
    color: black

.layout-message
  position: fixed
  top: 0
  left: 0
  right: 0
  bottom: 0
  pointer-events: none
  display: flex
  justify-content: center
  align-items: center
  flex-direction: column


.popup-message
  position: fixed
  width: 80vw
  max-width: 300px
  background-color: white
  box-shadow: 0 2px 20px rgba(0, 0, 0, 0.2)
  border-radius: 15px
  text-align: center
  display: flex
  justify-content: center
  align-items: center
  flex-direction: column
  padding: 35px 30px
  box-sizing: border-box
  font-weight: 500
  line-height: 1.5em

</style>
