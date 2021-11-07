<template>
  <start-page v-if="page === 'start'"/>
  <photo-page v-if="page === 'photo'"/>
  <final-page v-if="page === 'final'"/>
  <exit-page v-if="page === 'exit'"/>
  <modal-alert></modal-alert>
</template>

<script>
import './styles/global.sass'
import 'swiper/swiper.min.css'

import StartPage from './pages/start-page'
import PhotoPage from './pages/photo-page'
import FinalPage from './pages/final-page'
import ExitPage from './pages/exit-page'
import ModalAlert from './components/modal-alert'
import { mapState } from 'vuex'

export default {
  components: { StartPage, PhotoPage, FinalPage, ExitPage, ModalAlert },
  name: 'App',
  computed: mapState('pages', [ 'page' ]),
  mounted(){
    //this.$store.commit("pages/setPage", 'final')
    //this.$store.commit("mts/setPhoto", '/_assets/photo.jpg')
  }
}
</script>
