require.config
  map:
    '*':
      'themes/default/views/pages/base/bare': 'themes/turntable/views/pages/base/bare'
      'themes/default/templates/app': 'themes/turntable/templates/app'
      'themes/default/templates/pages/landing': 'themes/turntable/templates/pages/landing'
      'themes/default/templates/links/navigation': 'themes/turntable/templates/links/navigation'

define [
  'jquery'
  'themes/default/app'
], ($, App) ->

  $ -> new App $('#tt-template'), '/'
