<template>
  <header class="header">
    <h3>Оцените своё изображение</h3>
  </header>
  <div class="content">
    <img :src="`/assets/${$store.state.photoId}`" class="image"/>
  </div>
  <div class="panel">
    <button @click="$store.commit('setPage', 'start')">
      <v-icon name="undo" style="height: 1.1em"/>
    </button>
    <button @click="download">
      <v-icon name="file-download"/>
   </button>
   <button @click="$store.dispatch('exitApp')">
      <v-icon name="long-arrow-alt-right" style="height: 1.7em"/>
   </button>
  </div>
</template>

<script>

export default {
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
    }
  }
}
</script>

<style lang="sass" scoped>
  .image 
    max-width: 80vw
    max-height: 60vh

  .panel
    display: flex
    align-items: flex-start
    justify-content: center
    height: 4.5em

    button, a
      display: block
      color: white
      background-color: #E1001E
      height: 3.5em
      width: 3.5em
      border: none
      border-radius: 0.5em
      font-size: inherit
      display: flex
      align-items: center
      justify-content: center
      margin: 0 0.9em
      svg
        height: 1.4em
  
</style>