define [
  'models/collection'
  'models/post'
], (Collection, Post) ->

  class Posts extends Collection

      model: -> Post.create(arguments...)