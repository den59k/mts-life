<template>
  <header class="header">
    <img :src="mtsLogo"/>
  </header>
  <div class="content">
    <h2>Добро пожаловать<br/> в МТС Live</h2>
  </div>
  <button :class="{ button: true, disable: !canPhoto }" @click="makePhoto">
    Сделать фото<br/> с Анастасией Стоцкой
  </button>
  <img class="logo2" :src="logo2"/>
</template>

<script>
import mtsLogo from '../../assets/mts-logo.svg'
import logo2 from '../../assets/logo2.png'

export default {
  data() {
    return { mtsLogo, logo2 }
  },
  props: {
    canPhoto: Boolean
  },
  methods: {
    makePhoto() {
      this.$store.dispatch("photo")
    }
  }
}
</script>

<style lang="sass" scoped>
.attempts
  text-align: center

.content
  flex: 1 1 auto
  display: flex
  flex-direction: column
  justify-content: center
  align-items: center

  img
    width: 60vw
    max-width: 300px


.button
  transition: transform 0.4s, opacity 0.4s
  margin: 15px 0

  &.disable
    transform: translateY(30px)
    opacity: 0

</style>
