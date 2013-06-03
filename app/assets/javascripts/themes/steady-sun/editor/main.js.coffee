override =
  'views/pages': [
    'news', 'listen', 'photos', 'videos', 'tour', 'follow', 'contact', 'custom'
  ]
  'editor/views/pages': [
    'news', 'listen', 'photos', 'videos', 'tour', 'follow', 'contact', 'custom'
  ]

require.config
  helpers: [
    label: 'editor'
    pattern: '(at-ss|at-common)'
    replace: '$1/editor'
  ]
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

  $ -> init('/edit/')
