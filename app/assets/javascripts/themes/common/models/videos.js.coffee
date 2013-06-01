define [
  'at-common/models/collection'
  'at-common/models/video'
], (Collection, Video) ->

  class Videos extends Collection

    model: -> Video.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/videos'
