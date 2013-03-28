define [
  'themes/common/models/collection'
  'themes/common/models/post'
], (Collection, Post) ->

  class Posts extends Collection

    model: -> Post.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/posts'
