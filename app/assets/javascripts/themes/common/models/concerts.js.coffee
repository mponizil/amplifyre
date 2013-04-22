define [
  'lib/superset'
  'themes/common/models/concert'
], (Superset, Concert) ->

  class Concerts extends Superset

    model: -> Concert.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/concerts'

    subsets:

      future: (concert) -> @indexOf(concert) > 0
