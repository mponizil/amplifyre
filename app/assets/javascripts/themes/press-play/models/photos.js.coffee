define [
  'models/collection'
  'models/photo'
], (Collection, Photo) ->

  class Photos extends Collection

      model: -> Photo.create(arguments...)

      url: -> super + '/band_sites/' + @owner.id + '/photos'
