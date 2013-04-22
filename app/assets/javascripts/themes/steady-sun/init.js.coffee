define [
  'jquery'
  'backbone'
  'themes/common/router'
  'themes/common/models/band_site'
  'at-ss/views/view'
  'themes/common/views/helper-view'
  'at-ss/views/app'
], ($, Backbone, Router, BandSite, View, HelperView, App) ->

  (root) ->

    bootstrap = JSON.parse($('#bootstrap').html())

    $.ajaxSetup(headers: 'X-CSRF-Token': bootstrap.auth_token)

    band_site = BandSite.create(bootstrap.band_site)
    pages = band_site.pages().reset(bootstrap.pages)

    View::band_site = HelperView::band_site = band_site

    router = new Router {band_site, pages}

    new App
      el: $('#ss-template')
      model: band_site
      pages: pages
      bootstrap: bootstrap
      router: router
    .render()

    Backbone.history.start(pushState: true, root: root)
