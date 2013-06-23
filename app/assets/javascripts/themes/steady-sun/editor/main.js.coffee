require.config
  helpers: [
    label: 'editor'
    pattern: '(themes/steady-sun|themes/default)'
    replace: 'themes/default/editor'
  ]
  map:
    '*':
      # Views.
      'themes/default/views/app': 'themes/steady-sun/views/app'
      'themes/default/views/pages/listen': 'themes/steady-sun/views/pages/listen'
      'themes/default/views/pages/videos': 'themes/steady-sun/views/pages/videos'
      'themes/default/views/pages/tour': 'themes/steady-sun/views/pages/tour'
      'themes/default/views/pages/follow': 'themes/steady-sun/views/pages/follow'
      'themes/default/views/music/album': 'themes/steady-sun/views/music/album'

      # Templates.
      'themes/default/templates/pages/news': 'themes/steady-sun/templates/pages/news'
      'themes/default/templates/pages/photos': 'themes/steady-sun/templates/pages/photos'
      'themes/default/templates/pages/contact': 'themes/steady-sun/templates/pages/contact'

      # Editor views.
      'themes/default/editor/views/app': 'themes/steady-sun/editor/views/app'
      'themes/default/editor/views/pages/listen': 'themes/steady-sun/editor/views/pages/listen'
      'themes/default/editor/views/pages/videos': 'themes/steady-sun/editor/views/pages/videos'
      'themes/default/editor/views/pages/follow': 'themes/steady-sun/editor/views/pages/follow'

define [
  'jquery'
  'themes/default/app'
], ($, App) ->

  $ -> new App $('#ss-template'), '/edit/'
