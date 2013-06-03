require.config
  helpers: [
    label: 'editor'
    pattern: '(themes/steady-sun|themes/common)'
    replace: '$1/editor'
  ]
  map:
    '*':
      'themes/common/views/pages/news': 'themes/steady-sun/views/pages/news'
      'themes/common/views/pages/listen': 'themes/steady-sun/views/pages/listen'
      'themes/common/views/pages/photos': 'themes/steady-sun/views/pages/photos'
      'themes/common/views/pages/videos': 'themes/steady-sun/views/pages/videos'
      'themes/common/views/pages/tour': 'themes/steady-sun/views/pages/tour'
      'themes/common/views/pages/follow': 'themes/steady-sun/views/pages/follow'
      'themes/common/views/pages/contact': 'themes/steady-sun/views/pages/contact'
      'themes/common/views/pages/custom': 'themes/steady-sun/views/pages/custom'
      'themes/common/editor/views/pages/news': 'themes/steady-sun/editor/views/pages/news'
      'themes/common/editor/views/pages/listen': 'themes/steady-sun/editor/views/pages/listen'
      'themes/common/editor/views/pages/photos': 'themes/steady-sun/editor/views/pages/photos'
      'themes/common/editor/views/pages/videos': 'themes/steady-sun/editor/views/pages/videos'
      'themes/common/editor/views/pages/tour': 'themes/steady-sun/editor/views/pages/tour'
      'themes/common/editor/views/pages/follow': 'themes/steady-sun/editor/views/pages/follow'
      'themes/common/editor/views/pages/contact': 'themes/steady-sun/editor/views/pages/contact'
      'themes/common/editor/views/pages/custom': 'themes/steady-sun/editor/views/pages/custom'

define [
  'jquery'
  'themes/steady-sun/init'
], ($, init) ->

  $ -> init('/edit/')
