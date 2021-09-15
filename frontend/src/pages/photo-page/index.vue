<template>
  <header class="header">
    <h3>Внимание на фотозону</h3>
  </header>
  <div class="content">
    <img :src="mtsLogo" alt="Логотип МТС" />
  </div>
</template>

<script>
import mtsLogo from '../../assets/mts-logo.svg'
import { STAND_ID } from '../../constants'
import { GET } from '../../libs/query'
export default {
  data() {
    return { mtsLogo }
  },
  name: "PhotoPage",
  mounted() {
    const ajax = async () => {
      const standInfo = await GET("/items/stands/"+STAND_ID, { "fields[]": "id,status,photo.file" })
      if(standInfo.status === "available") return this.$store.commit("setPage", "start")
      if(standInfo.status === "final") {
        console.log(standInfo)
        this.$store.commit("setPhotoId", standInfo.photo.file)
        return this.$store.commit("setPage", "final")
      }
      await new Promise(res => setTimeout(res, 500))
      ajax()
    }
    setTimeout(() => ajax(), 2000)
  }
}
</script>

<style lang="sass" scoped>

  img
    width: 60vw
    max-width: 300px

</style>