define [
  'at-common/models/model'
], (Model) ->

  class BandSite extends Model

    name: 'band_site'

    label: 'amplifyre'

    urlRoot: -> @urlPrefix() + 'band_sites'

    subscribe: (attrs, options) ->
      options.url = @url() + '/subscribe'
      @save(attrs, options)

    defaults: ->
      background_file:
        url: '/assets/global/dark-loader.gif'
        bw: url: '/assets/global/dark-loader.gif'
