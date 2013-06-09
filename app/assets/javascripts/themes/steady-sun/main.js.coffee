require.config
  map:
    '*':
      # Views.
      'themes/default/views/app': 'themes/steady-sun/views/app'
      'themes/default/views/pages/base/bare': 'themes/steady-sun/views/pages/base/bare'
      'themes/default/views/pages/news': 'themes/steady-sun/views/pages/news'
      'themes/default/views/pages/listen': 'themes/steady-sun/views/pages/listen'
      'themes/default/views/pages/photos': 'themes/steady-sun/views/pages/photos'
      'themes/default/views/pages/videos': 'themes/steady-sun/views/pages/videos'
      'themes/default/views/pages/tour': 'themes/steady-sun/views/pages/tour'
      'themes/default/views/pages/follow': 'themes/steady-sun/views/pages/follow'

      # Templates.
      'themes/default/templates/pages/contact': 'themes/steady-sun/templates/pages/contact'

define [
  'jquery'
  'themes/default/app'
], ($, App) ->

  $ -> new App $('#ss-template'), '/'
