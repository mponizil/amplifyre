override =
  'views/pages': [
    'news', 'listen', 'photos', 'videos', 'tour', 'follow', 'contact', 'custom'
  ]

require.config
  map:
    '*': do (from='at-common', to='at-ss') ->
      map = {}
      for prefix, modules of override
        for module in modules
          map["#{ from }/#{ prefix }/#{ module }"] = "#{ to }/#{ prefix }/#{ module }"
      return map

define [
  'jquery'
  'at-ss/init'
], ($, init) ->

  $ -> init('/')
