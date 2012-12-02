define [
  'at-pp/models/collection'
  'at-pp/models/album'
], (Collection, Album) ->

  class Albums extends Collection

    model: -> Album.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/albums'

    name: 'albums'

    comparator: (album) -> album.get('position')
