require.config
  map:
    '*':
      'themes/default/views/app': 'themes/press-play/views/app'
      'themes/default/views/pages/news': 'themes/press-play/views/pages/news'
      'themes/default/views/pages/listen': 'themes/press-play/views/pages/listen'
      'themes/default/views/pages/photos': 'themes/press-play/views/pages/photos'
      'themes/default/views/pages/tour': 'themes/press-play/views/pages/tour'
      'themes/default/views/pages/contact': 'themes/press-play/views/pages/contact'
      'themes/default/views/pages/custom': 'themes/press-play/views/pages/custom'

define [
  'jquery'
  'themes/default/app'
], ($, App) ->

  $ -> new App $('#pp-template'), '/'
