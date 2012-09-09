define [
  'views/app'
  'editor/views/pages'
], (App, EditPagesView) ->

  class EditApp extends App

    render: ->
      super

      @views.push(new EditPagesView
        el: @$page
        router: @router
        band_site: @band_site
        player: @player
      .render())

      @
