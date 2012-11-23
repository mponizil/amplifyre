define [
  'jquery'
  'backbone'
  'router'
  'models/band_site'
  'models/pages'
  'views/app'
], ($, Backbone, Router, BandSite, Pages, App) ->

  editMode = window.location.pathname.indexOf('/edit') is 0
  historyRoot = if editMode then '/edit/' else '/'

  $ ->

    bootstrap = JSON.parse($('#bootstrap').html())

    band_site = BandSite.create(bootstrap.band_site)
    pages = band_site.pages().reset(bootstrap.pages)

    router = new Router
      pages: pages
    Backbone.history or= new Backbone.History()
    Backbone.history.options = {root: historyRoot}

    new App
      el: $('[data-press-play]')
      model: band_site
      pages: pages
      bootstrap: bootstrap
      router: router
    .render()

    Backbone.history.start(pushState: true)
