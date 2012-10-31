define [
  'models/model'
], (Model) ->

  class BandSite extends Model

    name: 'band_site'

    label: 'amplifyre'

    urlRoot: -> @urlPrefix + 'band_sites'
