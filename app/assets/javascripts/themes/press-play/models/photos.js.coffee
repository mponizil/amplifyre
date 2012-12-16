define [
  'at-pp/models/collection'
  'at-pp/models/photo'
], (Collection, Photo) ->

  class Photos extends Collection

    model: -> Photo.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/photos'
