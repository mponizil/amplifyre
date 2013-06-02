require.config
  helpers: [
    label: 'editor'
    pattern: '(at-ss)|(at-common)'
    replace: 'at-ss/editor'
  ]

define [
  'jquery'
  'at-ss/init'
], ($, init) ->

  $ -> init('/edit/')
