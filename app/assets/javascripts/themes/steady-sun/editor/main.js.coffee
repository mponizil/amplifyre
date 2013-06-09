require.config
  helpers: [
    label: 'editor'
    pattern: '(themes/steady-sun|themes/default)'
    replace: '$1/editor'
  ]
  map:
    '*':
      # Overrides.
      'themes/default/views/app': 'themes/steady-sun/views/app'
      'themes/default/views/pages/news': 'themes/steady-sun/views/pages/news'
      'themes/default/views/pages/listen': 'themes/steady-sun/views/pages/listen'
      'themes/default/views/pages/photos': 'themes/steady-sun/views/pages/photos'
      'themes/default/views/pages/videos': 'themes/steady-sun/views/pages/videos'
      'themes/default/views/pages/tour': 'themes/steady-sun/views/pages/tour'
      'themes/default/views/pages/follow': 'themes/steady-sun/views/pages/follow'
      'themes/default/templates/pages/contact': 'themes/steady-sun/templates/pages/contact'

      # Editor overrides.
      'themes/default/editor/views/app': 'themes/steady-sun/editor/views/app'
      'themes/default/editor/views/pages/news': 'themes/steady-sun/editor/views/pages/news'
      'themes/default/editor/views/pages/listen': 'themes/steady-sun/editor/views/pages/listen'
      'themes/default/editor/views/pages/photos': 'themes/steady-sun/editor/views/pages/photos'
      'themes/default/editor/views/pages/videos': 'themes/steady-sun/editor/views/pages/videos'
      'themes/default/editor/views/pages/tour': 'themes/steady-sun/editor/views/pages/tour'
      'themes/default/editor/views/pages/follow': 'themes/steady-sun/editor/views/pages/follow'

define [
  'jquery'
  'themes/default/app'
], ($, App) ->

  $ -> new App $('#ss-template'), '/edit/'
