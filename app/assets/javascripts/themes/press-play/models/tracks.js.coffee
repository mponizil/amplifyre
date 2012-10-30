define [
  'models/collection'
  'models/track'
], (Collection, Track) ->

  class Tracks extends Collection

    model: -> Track.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/tracks'

    singles: ->
      @filter (track) -> track.get('album_id') is null
