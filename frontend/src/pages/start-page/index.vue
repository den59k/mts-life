<template>
  <div class="layout layout-container" v-if="loaded">
    <img class="mts-logo" src="/_assets/mts-logo.svg" alt="Лого МТС"/>
    <h1 style="margin: 0">Добро пожаловать<br/>в МТС Live</h1>
    <div class="slider-container">
      <button class="arrowButton" :class="{disable: page === 0}" @click="slidePrev">
        <img src="./arrow.svg" alt="Стрелка"/>
      </button>
      <button class="arrowButton right" :class="{disable: page === images.length-1}" @click="slideNext">
        <img src="./arrow.svg" alt="Стрелка"/>
      </button>
      <swiper
        :modules="[Virtual]"
        virtual
        :slides-per-view="1"
        @swiper="onSwiper"
        @slideChange="onSlideChange"
        style="width: 100%"
      > 
        <swiper-slide
          v-for="(imageData, index) in images"
          :key=index
          :virtualIndex="index"
          class="slide"
        >
          <img :src="imageData.img" :alt="imageData.title"/>
          <div class="label">{{imageData.title}}</div>
        </swiper-slide>
      </swiper>
    </div>
    
    <button class="btn" @click="makePhoto">Сделать фото</button>
    <div class="layout-label">Выберите<br/>сценарий<br/>для фото</div>
  </div>
  <div class="layout layout-container" v-if="!loaded">
    <h1>Загрузка...</h1>
  </div>
</template>

<script>
import { Virtual } from 'swiper'
import { Swiper, SwiperSlide } from 'swiper/vue/swiper-vue'
import { mapActions } from 'vuex'

export default {
  name: "StartPage",
  data() {
    return {
      page: 0,
      Virtual,
      images: [  ],
      swiper: null,
      loaded: false
    }
  },
  components: {
    Swiper,
    SwiperSlide,
  },
  mounted(){
    this.launch().then((data) => {
      this.images = data.scenarios.map(i => ({
        ...i, img: `/_assets/images/${i.code_name}.png`
      }))
      this.loaded = true
    })
  },
  methods: {
    onSwiper (swiper) {
      this.swiper = swiper
      this.onSlideChange(swiper)
    },
    onSlideChange (swiper){
      this.page = swiper.activeIndex
      this.changeScenario(this.images[this.page].code_name)
    },
    slideNext (){ this.swiper.slideNext() },
    slidePrev (){ this.swiper.slidePrev() },
    ...mapActions(['launch', 'changeScenario', 'makePhoto'])
  }
}
</script>

<style lang="sass">

.slider-container
  display: flex
  flex-direction: column
  justify-content: center
  position: relative
  margin: 0 -2em
  margin-top: -1em

  .arrowButton
    background: none
    border: none
    position: absolute
    height: 100%
    display: flex
    flex-direction: column
    justify-content: center
    z-index: 2
    left: 0.9em
    transition: opacity 0.3s, transform 0.3s

    &.disable
      transform: scale(0.5)
      opacity: 0

    img 
      height: 30px

      @media(max-width: 350px)
        height: 20px

    &.right
      left: auto
      right: 0.9em
      img
        transform: scale(-1, 1)

.slide
  display: flex
  align-items: center
  justify-content: center
  flex-direction: column
  position: relative

  .label
    text-transform: uppercase
    font-size: 2em
    font-weight: 700
    margin-top: -0.9em

  img
    width: 75vw

    @media(min-width: 400px )
      width: 400px*0.75

.layout-container
  flex: 1 1 auto
  display: flex
  flex-direction: column
  justify-content: space-around

.layout-label
  font-size: 1.3em
  text-transform: uppercase
  font-weight: 500
  text-align: center

</style>

