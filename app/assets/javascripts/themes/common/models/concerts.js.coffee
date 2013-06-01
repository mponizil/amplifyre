define [
  'underscore'
  'moment'
  'lib/superset'
  'at-common/models/collection'
  'at-common/models/concert'
], (_, moment, Superset, Collection, Concert) ->

  class Concerts extends Collection

    _.defaults this::, Superset::

    initialize: ->
      super
      @on('change:date', @sort, @)

    model: -> Concert.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/concerts'

    comparator: (concert) -> moment(concert.get('date')).unix()

    subsets:

      future: (concert) -> @indexOf(concert) > 0
