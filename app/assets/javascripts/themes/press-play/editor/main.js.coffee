require.config
  helpers: [
    label: 'editor'
    pattern: '(themes/press-play|themes/default)'
    replace: 'themes/default/editor'
  ]
  map:
    '*':
      # Views.
      'themes/default/views/app': 'themes/press-play/views/app'
      'themes/default/views/pages/landing': 'themes/press-play/views/pages/landing'
      'themes/default/views/pages/news': 'themes/press-play/views/pages/news'
      'themes/default/views/pages/listen': 'themes/press-play/views/pages/listen'
      'themes/default/views/pages/photos': 'themes/press-play/views/pages/photos'
      'themes/default/views/pages/tour': 'themes/press-play/views/pages/tour'
      'themes/default/views/pages/contact': 'themes/press-play/views/pages/contact'
      'themes/default/views/pages/custom': 'themes/press-play/views/pages/custom'
      'themes/default/views/content/concert': 'themes/press-play/views/content/concert'
      'themes/default/views/music/player/ticker': 'themes/press-play/views/music/player/ticker'

      # Templates.
      'themes/default/templates/pages/landing': 'themes/press-play/templates/pages/landing'
      'themes/default/templates/links/navigation': 'themes/turntable/templates/links/navigation'

      # Editor views.
      'themes/default/editor/views/app': 'themes/press-play/editor/views/app'
      'themes/default/editor/views/pages/listen': 'themes/press-play/editor/views/pages/listen'
      'themes/default/editor/views/pages/tour': 'themes/press-play/editor/views/pages/tour'
      'themes/default/editor/views/visual/background': 'themes/press-play/editor/views/visual/background'
      'themes/default/editor/views/music/player/ticker': 'themes/press-play/editor/views/music/player/ticker'

define [
  'jquery'
  'themes/default/app'
], ($, App) ->

  $ -> new App $('#pp-template'), '/edit/'
