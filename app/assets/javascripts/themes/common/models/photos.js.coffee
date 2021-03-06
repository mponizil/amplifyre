define [
  'themes/common/models/collection'
  'themes/common/models/photo'
], (Collection, Photo) ->

  class Photos extends Collection

    model: -> Photo.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/photos'

    comparator: (photo) -> photo.get('position')
