
module.exports = (grunt) ->

  grunt.registerTask 'server', [
    'clean:server'
    'style-server'
    'connect:server'
    'watch'
  ]

  watch:
    livereload:
      options:
        livereload: '<%= connect.options.livereload %>'
      files: [
        'app/*.html',
        '.tmp/styles/{,*/}*.css',
        '{.tmp,app}/scripts/{,*/}*.js',
        'app/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
      ]

  clean:
    server: ['.tmp']

  connect:
    options:
      port: 9000
      livereload: 35729
      hostname: '0.0.0.0'
    server:
      options:
        open: true
        base: [
          '.tmp',
          'app'
        ]
    test:
      options:
        base: [
          '.tmp'
          'test'
          'app'
        ]
    dist:
      options:
        open: true
        base: 'dist'
