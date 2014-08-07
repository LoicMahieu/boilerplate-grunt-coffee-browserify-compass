
module.exports = (grunt) ->
  grunt.registerTask 'coffee-build', ['coffeelint', 'coffee']

  watch:
    coffee:
      files: ['Gruntfile.coffee', 'app/scripts/**/*.{coffee,litcoffee,coffee.md}']
      tasks: ['newer:coffeelint', 'newer:coffee']

  coffeelint:
    app: ['Gruntfile.coffee', 'app/scripts/**/*.{coffee,litcoffee,coffee.md}']
    test: ['test/{,*/}*.{coffee,litcoffee,coffee.md}']

  coffee:
    app:
      files: [
        expand: true,
        cwd: 'app/scripts',
        src: '**/*.{coffee,litcoffee,coffee.md}',
        dest: '.tmp/scripts',
        ext: '.js'
      ]
    test:
      files: [
        expand: true,
        cwd: 'test',
        src: '{,*/}*.{coffee,litcoffee,coffee.md}',
        dest: '.tmp/test',
        ext: '.js'
      ]
