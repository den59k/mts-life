<template>
  <div class="content">
    <div class="imageWrapper">
      <img :src="`/assets/${$store.state.photoId}`" class="image"/>
      <div v-if="attempts < 2" class="label">
        {{strAttempts}}
      </div>
    </div>
  </div>
  <div class="panel">
    <button v-if="attempts > 0" @click="$store.dispatch('makeAnotherPhoto')">
      Переснять
    </button>
    <div v-else></div>
    <button @click="download">
      Сохранить
   </button>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: mapState({
    attempts: state => state.attempts,
    strAttempts: state => ['Закончился лимит фото', 'Осталась одна попытка', 'Осталось две попытки', 'Осталось три попытки'][state.attempts]
  }),
  methods: {
    async download() {
      const image = await fetch(`assets/${this.$store.state.photoId}`)
      const imageBlog = await image.blob()
      const imageURL = URL.createObjectURL(imageBlog)

      const link = document.createElement('a')
      link.href = imageURL
      link.download = 'photo.jpg'
      document.body.appendChild(link)
      link.click()
      document.body.removeChild(link)

      this.$store.dispatch('exitApp')
    }
  }
}
</script>

<style lang="sass" scoped>

  .imageWrapper
    border-radius: 0.8em
    overflow: hidden
    display: flex
    flex-direction: column

    .label
      font-weight: 900
      background-color: black
      color: white
      text-align: center
      padding: 0.8em
      font-size: 0.9em

  .image 
    width: 100%
    max-width: 500px
    max-height: 80vh
    height: auto
    object-fit: cover

  .panel
    display: flex
    align-items: flex-start
    justify-content: space-between
    height: 4.5em

    button, a
      display: block
      color: white
      background-color: #E1001E
      border: none
      border-radius: 0.5em
      display: flex
      align-items: center
      justify-content: center
      font-family: "MTS Sans", sans-serif
      font-weight: 900
      padding: 0.8em 0
      flex: 1 1 auto
      font-size: 1em
      line-height: 1.5em
      &:not(:last-child)
        margin-right: 2em
        @media(max-width: 350px)
          margin-right: 0.5em
      svg
        height: 1.4em
  
</style>