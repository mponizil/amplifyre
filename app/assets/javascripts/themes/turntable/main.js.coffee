require.config
  map:
    '*':
      'themes/default/templates/app': 'themes/turntable/templates/app'
      'themes/default/templates/links/navigation': 'themes/turntable/templates/links/navigation'

define [
  'jquery'
  'themes/default/app'
], ($, App) ->

  $ -> new App $('#tt-template'), '/'
