
module.exports = (grunt) ->

  grunt.registerTask 'server', [
    'clean:server'
    'concurrent:server'
    'connect:server'
    'browserify:watch'
    'watch'
  ]

  watch:
    livereload:
      options:
        livereload: '<%= connect.server.options.livereload %>'
      files: [
        'app/*.html',
        '.tmp/styles/{,*/}*.css',
        '{.tmp,app}/scripts/{,*/}*.js',
        'app/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
      ]

  concurrent:
    server: [
      'style-server'
      'src-server'
    ]

  clean:
    server: ['.tmp']

  connect:
    server:
      options:
        port: 9000
        livereload: 35729
        hostname: '0.0.0.0'
        open: true
        base: [
          '.tmp',
          'app'
        ]
