require.config
  helpers: [{
    label: 'editor'
    pattern: 'at-ss'
    replace: 'at-ss/editor'
  }, {
    label: 'editor'
    pattern: 'themes/common'
    replace: 'at-ss/editor'
  }]

define [
  'jquery'
  'at-ss/init'
], ($, init) ->

  $ -> init('/edit/')
