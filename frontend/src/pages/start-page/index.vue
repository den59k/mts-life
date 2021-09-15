<template>
  <header class="header">
    <h3>ВЫ НАХОДИТЕСЬ В ФОТОЗОНЕ МЮЗИКЛА «ШАХМАТЫ»</h3>
  </header>
  <div class="content">
    <img :src="mtsLogo" alt="Логотип МТС" />
  </div>
  <button :class="{ button: true, disable: !canPhoto }" @click="makePhoto">
    Сделать фото с героиней мьюзикла
  </button>
</template>

<script>
import mtsLogo from '../../assets/mts-logo.svg'
export default {
  data() {
    return { mtsLogo }
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
  transition: 0.4s
  margin: 15px 15px

  &.disable
    transform: translateY(30px)
    opacity: 0

</style>
