module.exports = {
  outputDir: 'dist',
  assetsDir: '_assets',
  devServer: {
    proxy: 'http://localhost:8055'
  },
  transpileDependencies: [
    /\bvue-awesome\b/
  ]
}

