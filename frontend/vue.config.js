module.exports = {
  configureWebpack: {
    plugins: [
      
    ]
  },
  devServer: {
    proxy: 'http://localhost:8055'
  },
  transpileDependencies: [
    /\bvue-awesome\b/
  ]
}

