define [
  'models/model'
], (Model) ->

  class BandSite extends Model

    defaults:
      id: null
      name: null
      tagline: null
