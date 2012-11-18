define [
  'jquery'
  'backbone'
  'router'
  'models/band_site'
  'models/pages'
  'editor/views/app'
], ($, Backbone, Router, BandSite, Pages, EditApp) ->

  $ ->

    bootstrap = JSON.parse($('#bootstrap').html())

    band_site = BandSite.create(bootstrap.band_site)
    pages = band_site.pages().reset(bootstrap.pages)

    router = new Router
      pages: pages
    Backbone.history or= new Backbone.History()
    Backbone.history.options = {root: '/edit/'}

    new EditApp
      el: $('[data-press-play]')
      model: band_site
      pages: pages
      bootstrap: bootstrap
      router: router
    .render()

    Backbone.history.start(pushState: true)
