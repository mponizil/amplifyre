define [
  'jquery'
  'backbone'
  'themes/common/models/band_site'
  'themes/common/models/player'
  'themes/common/router'
  'themes/common/views/view'
  'themes/common/views/helper-view'
  'themes/common/views/app'
  'themes/common/models/associations'
  'easing'
  'fancybox'
], ($, Backbone, BandSite, Player, Router, View, HelperView, AppView) ->

  collectionNames = ['socials', 'albums', 'tracks', 'photos', 'videos', 'posts', 'concerts']

  class App

    constructor: (@$app, @root) ->
      @initialize()
      @create()

      # TODO: scrap.
      View::band_site = HelperView::band_site = @band_site

      @render()

    initialize: ->
      @bootstrap = JSON.parse($('#bootstrap').html())
      $.ajaxSetup(headers: 'X-CSRF-Token': @bootstrap.auth_token)

    create: ->
      @band_site = BandSite.create(@bootstrap.band_site)
      @pages = @band_site.pages().reset(@bootstrap.pages)

      for collectionName in collectionNames
        collection = @band_site[collectionName]()
        bootstrapData = @bootstrap[collectionName]
        collection.reset(bootstrapData)

      @player = new Player(tracks: @band_site.tracks())

      @router = new Router({ @band_site, @pages })

    render: ->
      new AppView
        el: @$app
        model: @band_site
        pages: @pages
        player: @player
        router: @router
      .render()

      Backbone.history.start({ pushState: true, @root })
