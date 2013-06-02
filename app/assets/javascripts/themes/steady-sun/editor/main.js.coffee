require.config
  helpers: [
    label: 'editor'
    pattern: '(at-ss|at-common)'
    replace: '$1/editor'
  ]
  map:
    '*':
      'at-common/views/pages/news': 'at-ss/views/pages/news'
      'at-common/views/pages/listen': 'at-ss/views/pages/listen'
      'at-common/views/pages/photos': 'at-ss/views/pages/photos'
      'at-common/views/pages/videos': 'at-ss/views/pages/videos'
      'at-common/views/pages/tour': 'at-ss/views/pages/tour'
      'at-common/views/pages/follow': 'at-ss/views/pages/follow'
      'at-common/views/pages/contact': 'at-ss/views/pages/contact'
      'at-common/views/pages/custom': 'at-ss/views/pages/custom'
      'at-common/editor/views/pages/news': 'at-ss/editor/views/pages/news'
      'at-common/editor/views/pages/listen': 'at-ss/editor/views/pages/listen'
      'at-common/editor/views/pages/photos': 'at-ss/editor/views/pages/photos'
      'at-common/editor/views/pages/videos': 'at-ss/editor/views/pages/videos'
      'at-common/editor/views/pages/tour': 'at-ss/editor/views/pages/tour'
      'at-common/editor/views/pages/follow': 'at-ss/editor/views/pages/follow'
      'at-common/editor/views/pages/contact': 'at-ss/editor/views/pages/contact'
      'at-common/editor/views/pages/custom': 'at-ss/editor/views/pages/custom'

define [
  'jquery'
  'at-ss/init'
], ($, init) ->

  $ -> init('/edit/')
