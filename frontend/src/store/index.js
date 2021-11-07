import { createStore } from 'vuex'

import mts from './mts'
import pages from './pages'
import alerts from './alerts'

const store = createStore({
  modules: {
    mts,
    pages,
    alerts
  }
})

export default store