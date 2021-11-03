<template>
  <header class="header">
    <img class="img" :src="mtsLogo"/>
  </header>
  <div class="content">
    <h2 class="title">Спасибо!</h2>
    <div class="label">Фото сохранено<br/>на ваш телефон</div>
  </div>
  <img class="logo2" :src="logo2"/>
</template>

<script>
import mtsLogo from '../../assets/mts-logo.svg'
import logo2 from '../../assets/logo2.png'
export default {
  data() {
    return { mtsLogo, logo2 }
  },
}
</script>

<style lang="sass" scoped>
.img
  max-width: 8em
.label
  font-weight: 500
.title
  font-size: 1.8em
  margin-bottom: 0.3em

.logo2
  max-width: 8em
</style>