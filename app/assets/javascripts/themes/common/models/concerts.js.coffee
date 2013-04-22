define [
  'moment'
  'lib/superset'
  'themes/common/models/concert'
], (moment, Superset, Concert) ->

  class Concerts extends Superset

    model: -> Concert.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/concerts'

    comparator: (concert) -> moment(concert.get('date')).unix()

    subsets:

      future: (concert) -> @indexOf(concert) > 0
