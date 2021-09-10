<template>
  <h3>{{ msg }}</h3>
  <div class="row">
    <input v-model="message" placeholder="Введите задачу..." />
    <button @click="addTask">Добавить</button>
  </div>
  <div v-if="tasks.length === 0 && message === ''">Задач пока нет</div>
  <ul v-else class="tasks">
    <li v-for="task in tasks" :key="task.id" :class="{ complete: task.complete }">
      <div>{{ task.text }}</div>
      <button @click="task.complete=!task.complete">OK</button>
    </li>
    <li>{{ message }}</li>
  </ul>
</template>

<script>

export default {
  name: 'HelloWorld',
  data() {
    return {
      message: "",
      tasks: [],
      taskId: 0
    }
  },
  props: {
    msg: String
  },
  methods: {
    addTask(){
      this.tasks.push({ text: this.message, id: this.taskId })
      this.taskId++
      this.message = ""
    }
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="sass" scoped>
.tasks
  display: flex
  flex-direction: column
  align-items: center
  li
    display: flex
    flex-direction: row
    justify-content: center
    padding: 5px 0

    &.complete
      text-decoration: line-through

    button
      margin-left: 5px

.row
  display: flex
  justify-content: center

input
  font-family: inherit
  padding: 5px 0

h3
  margin: 40px 0 0

ul
  list-style-type: none
  padding: 0

li
  display: inline-block
  margin: 0 10px

a
  color: #42b983

</style>
