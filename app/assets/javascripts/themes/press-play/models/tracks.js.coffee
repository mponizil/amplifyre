define [
  'models/collection'
  'models/track'
], (Collection, Track) ->

  class Tracks extends Collection
      model: Track