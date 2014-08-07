
module.exports = (grunt) ->
  grunt.registerTask 'src-server', ['coffeelint']

  watch:
    coffee:
      files: ['Gruntfile.coffee', 'app/scripts/**/*.{coffee,litcoffee,coffee.md}']
      tasks: ['newer:coffeelint']

  coffeelint:
    app: ['Gruntfile.coffee', 'app/scripts/**/*.{coffee,litcoffee,coffee.md}']
    test: ['test/{,*/}*.{coffee,litcoffee,coffee.md}']

  browserify:
    options:
      transform: ['coffeeify']
      browserifyOptions: extensions: '.coffee'
    app:
      files:
        '.tmp/scripts/main.js': ['app/scripts/main.coffee']
    watch:
      files: ['<%= browserify.app.files %>']
      options:
        watch: ['app/scripts/**/*.{coffee,litcoffee,coffee.md}']
        bundleOptions: debug: true
