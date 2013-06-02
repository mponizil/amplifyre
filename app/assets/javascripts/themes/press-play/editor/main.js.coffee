require.config
  helpers: [
    label: 'editor'
    pattern: '(at-pp|at-common)'
    replace: '$1/editor'
  ]

define [
  'jquery'
  'at-pp/init'
], ($, init) ->

  $ -> init('/edit/')
