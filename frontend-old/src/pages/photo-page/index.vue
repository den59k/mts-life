<template>
  <header class="header">
    <img :src="mtsLogo"/>
  </header>
  <div class="content">
    <h2>Внимание на экран фотозоны</h2>
  </div>
  <img class="logo2" :src="logo2"/>
</template>

<script>
import mtsLogo from '../../assets/mts-logo.svg'
import logo2 from '../../assets/logo2.png'
import { GET } from '../../libs/query'
export default {
  data() {
    return { mtsLogo, logo2 }
  },
  name: "PhotoPage",
  mounted() {
    const ajax = async () => {
      const standInfo = await GET("/items/stands/"+this.$store.state.standId, { "fields[]": "id,status,photo.file" })
      if(standInfo.status === "available") return this.$store.commit("setPage", "start")
      if(standInfo.status === "final") {
        this.$store.commit("setPhotoId", standInfo.photo.file)
        return this.$store.commit("setPage", "final")
      }
      await new Promise(res => setTimeout(res, 500))
      ajax()
    }
    setTimeout(() => ajax(), 5000)
  }
}
</script>

<style lang="sass" scoped>

</style>