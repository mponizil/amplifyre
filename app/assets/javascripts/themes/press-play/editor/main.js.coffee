require.config
  helpers: [
    label: 'editor'
    pattern: 'at-pp'
    replace: 'at-pp/editor'
  ]

define [
  'jquery'
  'at-pp/init'
], ($, init) ->

  $ -> init('/edit/')
