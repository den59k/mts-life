import { createApp } from 'vue'
import App from './App.vue'
import pageStore from './stores/pages'
import icons from "v-svg-icons";

const app = createApp(App)
app.use(pageStore)
app.component("v-icon", icons);
app.mount('#app')
