import { createApp } from 'vue'
import App from './App.vue'
import pageStore from './stores/pages'

const app = createApp(App)
app.use(pageStore)
app.mount('#app')

function resize(){
  // We execute the same script as before
  let vh = window.innerHeight * 0.01;
  document.documentElement.style.setProperty('--vh', `${vh}px`);
}
window.addEventListener('resize', resize);
resize();
