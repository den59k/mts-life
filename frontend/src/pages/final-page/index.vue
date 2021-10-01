<template>
  <div class="content">
    <div class="imageWrapper">
      <img :src="`/assets/${$store.state.photoId}`" class="image"/>
      <div class="label">
        Осталась одна попытка
      </div>
    </div>
  </div>
  <div class="panel">
    <button @click="$store.commit('setPage', 'start')">
      Переснять
    </button>
    <button @click="download">
      Сохранить
   </button>
   <!-- <button @click="$store.dispatch('exitApp')">
      <v-icon name="long-arrow-alt-right" style="height: 1.7em"/>
   </button> -->
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
      padding: 0.5em 1em
      font-size: 0.9em
      svg
        height: 1.4em
  
</style>