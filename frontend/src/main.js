import { createApp } from 'vue'
import App from './App.vue'
import pageStore from './stores/pages'

const app = createApp(App)
app.use(pageStore)
app.mount('#app')
