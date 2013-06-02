require.config
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

define [
  'jquery'
  'at-ss/init'
], ($, init) ->

  $ -> init('/')
