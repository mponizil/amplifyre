define [
  'models/collection'
  'models/album'
], (Collection, Album) ->

  class Albums extends Collection
      model: Album