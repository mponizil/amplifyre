require.config
  helpers: [
    label: 'editor'
    pattern: '(themes/turntable|themes/default)'
    replace: '$1/editor'
  ]
  map:
    '*':
      # Views.
      'themes/default/views/pages/base/bare': 'themes/turntable/views/pages/base/bare'
      'themes/default/views/pages/listen': 'themes/turntable/views/pages/listen'
      'themes/default/views/music/album': 'themes/turntable/views/music/album'

      # Templates.
      'themes/default/templates/app': 'themes/turntable/templates/app'
      'themes/default/templates/pages/landing': 'themes/turntable/templates/pages/landing'
      'themes/default/templates/links/navigation': 'themes/turntable/templates/links/navigation'

define [
  'jquery'
  'themes/default/app'
], ($, App) ->

  $ -> new App $('#tt-template'), '/edit/'
