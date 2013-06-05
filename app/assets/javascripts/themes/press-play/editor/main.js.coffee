require.config
  helpers: [
    label: 'editor'
    pattern: '(themes/press-play|themes/common)'
    replace: '$1/editor'
  ]

define [
  'jquery'
  'themes/common/app'
], ($, App) ->

  $ -> new App $('#pp-template'), '/edit/'
