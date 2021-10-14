module.exports = {
  outputDir: 'dist',
  assetsDir: '_assets',
  devServer: {
    proxy: 'https://mts.easix.ru'
  },
  transpileDependencies: [
    /\bvue-awesome\b/
  ]
}

