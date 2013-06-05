define [
  'backbone'
  'themes/common/app'
  'help!themes/default/views/app'
], (Backbone, App, DefaultAppView) ->

  class DefaultApp extends App

    render: ->
      new DefaultAppView
        el: @$app
        model: @band_site
        pages: @pages
        player: @player
        router: @router
      .render()

      Backbone.history.start({ pushState: true, @root })
