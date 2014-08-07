
glob = require 'glob'
path = require 'path'

require('coffee-script/register')

module.exports = (grunt) ->
  require('time-grunt') grunt
  require('load-grunt-tasks') grunt

  _ = grunt.util._

  loadOptions = (config) ->
    glob.sync('grunt/**/*.coffee').forEach (v) ->
      module = path.join(
        __dirname,
        path.dirname(v),
        path.basename(v, path.extname(v))
      )
      _.merge(config, require(module)(grunt), _.defaults)

  config = {}
  loadOptions config
  grunt.initConfig config
