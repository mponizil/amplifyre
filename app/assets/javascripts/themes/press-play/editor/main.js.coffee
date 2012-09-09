define [
  'jquery'
  'backbone'
  'router'
  'models/band_site'
  'models/pages'
  'editor/views/app'
], ($, Backbone, Router, BandSite, Pages, EditApp) ->

  $ ->

    $.ajaxSetup
      headers:
        'X-Requested-With': 'XMLHttpRequest'

    bootstrap = JSON.parse($('#bootstrap').html())

    band_site = BandSite.create(bootstrap.band_site)
    pages = band_site.pages().reset(bootstrap.pages)

    router = new Router
      pages: pages
    Backbone.history or= new Backbone.History()
    Backbone.history.options = {root: '/edit/'}

    new EditApp
      el: 'body'
      band_site: band_site
      pages: pages
      bootstrap: bootstrap
      router: router
    .render()

    Backbone.history.start(pushState: true)
