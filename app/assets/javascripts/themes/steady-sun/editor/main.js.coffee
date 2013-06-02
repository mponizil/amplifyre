require.config
  helpers: [
    label: 'editor'
    pattern: '(at-ss|at-common)'
    replace: '$1/editor'
  ]

define [
  'jquery'
  'at-ss/init'
], ($, init) ->

  $ -> init('/edit/')
