
module.exports = (grunt) ->

  grunt.registerTask 'build', [
    'clean:dist'
    'useminPrepare'
    'concurrent:dist'
    'concat'
    'cssmin'
    'uglify'
    'copy:dist'
    'rev'
    'usemin'
    'htmlmin'
  ]

  concurrent:
    dist: [
      'src-dist'
      'style-dist'
      'copy:styles'
      'imagemin'
      'svgmin'
    ]

  clean:
    dist:
      files: [
        dot: true
        src: [
          '.tmp'
          'dist/*'
          '!dist/.git*'
        ]
      ]

  rev:
    dist:
      files:
        src: [
          'dist/scripts/{,*/}*.js'
          'dist/styles/{,*/}*.css'
          'dist/images/{,*/}*.*'
          'dist/styles/fonts/{,*/}*.*'
          'dist/*.{ico,png}'
        ]

  useminPrepare:
    options:
      dest: 'dist'
    html: 'app/index.html'

  usemin:
    options:
      assetsDirs: ['dist', 'dist/images']
    html: ['dist/{,*/}*.html']
    css: ['dist/styles/{,*/}*.css']

  imagemin:
    dist:
      files: [
        expand: true
        cwd: 'app/images'
        src: '{,*/}*.{gif,jpeg,jpg,png}'
        dest: 'dist/images'
      ]

  svgmin:
    dist:
      files: [
        expand: true
        cwd: 'app/images'
        src: '{,*/}*.svg'
        dest: 'dist/images'
      ]

  htmlmin:
    dist:
      options:
        collapseBooleanAttributes: true
        collapseWhitespace: true
        removeAttributeQuotes: true
        removeCommentsFromCDATA: true
        removeEmptyAttributes: true
        removeOptionalTags: true
        removeRedundantAttributes: true
        useShortDoctype: true
      files: [
        expand: true
        cwd: 'dist'
        src: '{,*/}*.html'
        dest: 'dist'
      ]

  copy:
    dist:
      files: [
        expand: true
        dot: true
        cwd: 'app'
        dest: 'dist'
        src: [
          '*.{ico,png,txt}'
          '.htaccess'
          'images/{,*/}*.webp'
          '{,*/}*.html'
          'styles/fonts/{,*/}*.*'
        ]
      ]
    styles:
      expand: true
      dot: true
      cwd: 'app/styles'
      dest: '.tmp/styles/'
      src: '{,*/}*.css'
