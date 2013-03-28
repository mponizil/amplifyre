define [
  'themes/common/models/collection'
  'themes/common/models/concert'
], (Collection, Concert) ->

  class Concerts extends Collection

    model: -> Concert.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/concerts'
