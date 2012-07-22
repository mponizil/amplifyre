define [
  'models/collection'
  'models/concert'
], (Collection, Concert) ->

  class Concerts extends Collection
      model: Concert