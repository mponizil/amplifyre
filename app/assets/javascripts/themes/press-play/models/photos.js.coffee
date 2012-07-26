define [
  'models/collection'
  'models/photo'
], (Collection, Photo) ->

  class Photos extends Collection

      model: -> Photo.create(arguments...)
