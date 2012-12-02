define [
  'at-pp/models/band_site'
  'at-pp/models/collection'
  'at-pp/models/track'
], (BandSite, Collection, Track) ->

  class Tracks extends Collection

    model: -> Track.create(arguments...)

    url: -> super + 'band_sites/' + @band_site_id() + '/tracks'

    name: 'tracks'

    comparator: (album) -> album.get('position')

    band_site_id: ->
      if @owner instanceof BandSite
        return @owner.get('id')
      else
        return @owner.get('band_site_id')

    singles: ->
      @filter (track) -> track.get('album_id') is -1
