<template>
  <div class="layout layout-container">
    <img class="mts-logo" src="/_assets/mts-logo.svg" alt="Лого МТС"/>
    <h2 class="h2">Внимание<br/>на экран фотозоны</h2>
  </div>
</template>

<script>
import { mapMutations, mapState } from 'vuex'
import { GET } from '../../libs/query'

export default {
  
  computed: mapState("mts", [ "stand_id" ]),
  methods: {
    ...mapMutations("pages", [ "setPage" ]),
    ...mapMutations("mts", [ "setPhoto" ])
  },
  mounted() {
    const ajax = async () => {
      const standInfo = await GET("/items/stands/"+this.stand_id, { "fields[]": "id,status,photo.file" })
      if(standInfo.status === "available") return this.setPage("start")
      if(standInfo.status === "final") {
        this.setPhoto("/assets/" + standInfo.photo.file)
        return this.setPage("final")
      }
      await new Promise(res => setTimeout(res, 500))
      ajax()
    }
    setTimeout(() => ajax(), 5000)
  }
}
</script>

<style lang="sass" scoped>
.h2
  text-align: center
  text-transform: uppercase

.mts-logo
  position: absolute
  top: 3em
</style>