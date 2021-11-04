<template>
  <div class="layout layout-container">
    <transition name="fade" class="scale">
      <img v-if="showPhoto" :src="photo" class="img" alt="Фото MTS-Life"/>
    </transition>
    <transition name="fade" class="move delay300">
      <div class="button-container" v-if="showPhoto">
        <button class="btn" @click="makePhotoAgain">Переснять</button>
        <button class="btn" @click="savePhoto">Сохранить</button>
      </div>
    </transition>
  </div>
</template>

<script>
import { mapActions, mapState } from 'vuex'

export default {
  data(){
    return {
      showPhoto: false,
      showBottomPanel: false
    }
  },
  mounted(){
    setTimeout(() => this.showPhoto = true, 700)
  },
  computed: mapState([ 'photo' ]),
  methods: mapActions([ 'savePhoto', 'makePhotoAgain' ])
}
</script>

<style lang="sass" scoped>
.null
  height: 88vh

.layout
  background-color: white

.img
  max-height: 88vh
  object-fit: contain
  border-radius: 1.5em

.button-container
  display: flex

  .btn
    flex: 1 1 auto
    &:not(:last-child)
      margin-right: 0.8em

</style>