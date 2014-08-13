
path = require 'path'

module.exports = (grunt) ->
  grunt.registerTask 'test', [
    'src-test'
    'karma:unit'
    'shell:webdriverupdate'
    'protractor:test'
  ]
  grunt.registerTask 'test-unit', ['src-test', 'karma:unit']
  grunt.registerTask 'test-specs', [
    'src-test'
    'shell:webdriverupdate'
    'protractor:test'
  ]

  grunt.registerTask 'serve-coverage', 'connect:coverage'

  watch:
    test:
      files: ['app/scripts/**/*.coffee']
      tasks: ['test']

  karma:
    unit:
      options:
        files: []
        background: false
        browsers: [
          'Chrome'
          'Firefox'
          # 'Opera'
          'Safari'
          'PhantomJS'
        ]
        frameworks: ['jasmine', 'browserify']
        plugins: [
          'karma-jasmine'
          'karma-chrome-launcher'
          'karma-firefox-launcher'
          # 'karma-opera-launcher'
          'karma-safari-launcher'
          'karma-phantomjs-launcher'
          'karma-coverage'
          'karma-browserifast'
        ]
        singleRun: true
        reporters: ['dots', 'coverage']
        coverageReporter:
          type: 'html'
          dir: 'coverage'
        preprocessors:
          '/**/*.browserify': ['browserify']
        browserify:
          files: [
            '.tmp/test/unit/main.js'
          ]
          transform: ['browserify-istanbul']

  protractor:
    test:
      options:
        configFile: 'protractor-conf.js'
        args:
          specs: ['.tmp/test/specs/*.js']

  shell:
    webdriverupdate:
      command: path.join(
        __dirname
        '..'
        'node_modules/grunt-protractor-runner'
        'node_modules/protractor'
        'bin/webdriver-manager update'
      )

  connect:
    coverage:
      options:
        port: 9001
        livereload: false
        open: true
        base: 'coverage'
        keepalive: true
