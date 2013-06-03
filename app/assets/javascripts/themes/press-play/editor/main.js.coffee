require.config
  helpers: [
    label: 'editor'
    pattern: '(themes/press-play|themes/common)'
    replace: '$1/editor'
  ]

define [
  'jquery'
  'themes/press-play/init'
], ($, init) ->

  $ -> init('/edit/')
