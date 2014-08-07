
module.exports = (grunt) ->

  grunt.registerTask 'style-server', ['compass:server', 'autoprefixer:style']
  grunt.registerTask 'style-dist', ['compass:dist', 'autoprefixer:style']

  watch:
    style:
      files: ['app/styles/**/*.{scss,sass}']
      tasks: ['compass:server', 'autoprefixer:server']

  compass:
    options:
      sassDir: 'app/styles'
      cssDir: '.tmp/styles'
      generatedImagesDir: '.tmp/images/generated'
      imagesDir: 'app/images'
      javascriptsDir: 'app/scripts'
      fontsDir: 'app/styles/fonts'
      httpImagesPath: '../images'
      httpGeneratedImagesPath: '../images/generated'
      httpFontsPath: '../styles/fonts'
      relativeAssets: false
      assetCacheBuster: false
    dist:
      options:
        generatedImagesDir: 'dist/images/generated'
    server:
      options:
        debugInfo: true

  autoprefixer:
    style:
      src: '.tmp/styles/**/*.css'
      options:
        browsers: ['> 1%', 'last 2 versions', 'Firefox ESR', 'Opera 12.1']
