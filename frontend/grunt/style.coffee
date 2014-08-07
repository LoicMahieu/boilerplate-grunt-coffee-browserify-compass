
module.exports = (grunt) ->

  grunt.registerTask 'style-server', ['compass:server', 'autoprefixer:server']

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
      importPath: 'app/bower_components'
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
    server:
      src: '.tmp/styles/**/*.css'
