define [
  'at-pp/models/collection'
  'at-pp/models/concert'
], (Collection, Concert) ->

  class Concerts extends Collection

    model: -> Concert.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/concerts'
