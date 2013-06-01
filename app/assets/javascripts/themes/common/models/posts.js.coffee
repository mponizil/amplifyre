define [
  'at-common/models/collection'
  'at-common/models/post'
], (Collection, Post) ->

  class Posts extends Collection

    model: -> Post.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/posts'
