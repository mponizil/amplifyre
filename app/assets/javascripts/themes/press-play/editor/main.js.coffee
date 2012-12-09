require.config
  helpers: [
    label: 'editor'
    pattern: 'at-pp'
    replace: 'at-pp/editor'
  ]

define [
  'jquery'
  'backbone'
  'at-pp/router'
  'at-pp/models/band_site'
  'at-pp/models/pages'
  'at-pp/views/view'
  'at-pp/views/helper-view'
  'at-pp/views/app'
], ($, Backbone, Router, BandSite, Pages, View, HelperView, App) ->

  $ ->

    bootstrap = JSON.parse($('#bootstrap').html())

    band_site = BandSite.create(bootstrap.band_site)
    pages = band_site.pages().reset(bootstrap.pages)

    View::band_site = HelperView::band_site = band_site

    router = new Router
      pages: pages
    Backbone.history or= new Backbone.History()
    Backbone.history.options = {root: '/edit/'}

    new App
      el: $('[data-press-play]')
      model: band_site
      pages: pages
      bootstrap: bootstrap
      router: router
    .render()

    Backbone.history.start(pushState: true)
