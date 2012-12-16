define [
  'at-pp/models/model'
], (Model) ->

  class BandSite extends Model

    name: 'band_site'

    label: 'amplifyre'

    urlRoot: -> @urlPrefix() + 'band_sites'

    defaults: ->
      background_file:
        url: '/assets/global/dark-loader.gif'
        bw: url: '/assets/global/dark-loader.gif'
