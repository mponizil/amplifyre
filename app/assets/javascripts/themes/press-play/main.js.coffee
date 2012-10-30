define [
  'jquery'
  'backbone'
  'router'
  'models/band_site'
  'models/pages'
  'views/app'
], ($, Backbone, Router, BandSite, Pages, App) ->

  $ ->

    bootstrap = JSON.parse($('#bootstrap').html())

    band_site = BandSite.create(bootstrap.band_site)
    pages = band_site.pages().reset(bootstrap.pages)

    router = new Router
      pages: pages
    Backbone.history or= new Backbone.History()
    Backbone.history.options = {root: '/'}

    new App
      el: 'body'
      model: band_site
      pages: pages
      bootstrap: bootstrap
      router: router
    .render()

    Backbone.history.start(pushState: true)
