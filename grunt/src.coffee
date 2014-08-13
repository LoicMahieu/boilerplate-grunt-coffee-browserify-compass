
module.exports = (grunt) ->
  grunt.registerTask 'src-server', ['coffeelint']
  grunt.registerTask 'src-dist', ['coffeelint', 'browserify:app']
  grunt.registerTask 'src-test', [
    'coffeelint'
    'coffee:apptest'
    'coffee:test'
  ]

  watch:
    coffee:
      files: [
        'Gruntfile.coffee'
        'app/scripts/**/*.{coffee,litcoffee,coffee.md}'
      ]
      tasks: ['newer:coffeelint']

  coffeelint:
    app: ['app/scripts/**/*.{coffee,litcoffee,coffee.md}']
    test: ['test/**/*.{coffee,litcoffee,coffee.md}']
    grunt: ['Gruntfile.coffee', 'grunt/**/*.coffee']

  browserify:
    options:
      transform: ['coffeeify']
      browserifyOptions:
        extensions: '.coffee'

    app:
      files:
        '.tmp/scripts/main-browserified.js': ['app/scripts/main.coffee']
    watch:
      files: ['<%= browserify.app.files %>']
      options:
        watch: ['app/scripts/**/*.{coffee,litcoffee,coffee.md}']
        bundleOptions: debug: true

  coffee:
    test:
      expand: true,
      cwd: 'test',
      src: ['**/*.coffee'],
      dest: '.tmp/test',
      ext: '.js'
    apptest:
      expand: true,
      cwd: 'app/scripts',
      src: ['**/*.coffee'],
      dest: '.tmp/scripts',
      ext: '.js'
