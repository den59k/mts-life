<template>
  <start-page v-if="page == 'start'"/>
  <photo-page v-if="page == 'photo'"/>
  <photo-page v-if="page == 'final'"/>
</template>

<script>
import './styles/global.sass'
import 'swiper/swiper.min.css'

import StartPage from './pages/start-page'
import PhotoPage from './pages/photo-page'
import { mapState } from 'vuex'

export default {
  components: { StartPage, PhotoPage },
  name: 'App',
  computed: mapState([ 'page' ]),
  mounted(){
    this.$store.commit("setPage", 'start')
  }
}
</script>
