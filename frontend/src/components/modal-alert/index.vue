<template>
  <div class="fixed">
    <transition name="fade" class="scale">
      <div v-if="text" class="text">{{ text }}</div>
    </transition>
  </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
  computed: mapState('alerts', [ 'text' ])
}
</script>

<style lang="sass" scoped>
.fixed
  position: fixed
  top: 0
  left: 0
  right: 0
  bottom: 0
  pointer-events: none
  z-index: 10
  display: flex
  flex-direction: column
  justify-content: center
  align-items: center

.text
  border: 1px solid #444444
  background-color: black
  padding: 1.2em 2em
  text-align: center
  font-size: 1.2em
  max-width: 80%
  font-weight: 500
  white-space: pre-wrap
  box-sizing: border-box

</style>