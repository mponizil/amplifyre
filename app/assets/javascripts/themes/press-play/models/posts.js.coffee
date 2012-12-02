define [
  'at-pp/models/collection'
  'at-pp/models/post'
], (Collection, Post) ->

  class Posts extends Collection

    model: -> Post.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/posts'
