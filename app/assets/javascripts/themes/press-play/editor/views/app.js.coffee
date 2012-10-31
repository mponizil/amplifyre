define [
  'views/app'
  'editor/views/pages'
  'editor/views/links/navigation'
], (App, EditPagesView, EditNavigationView) ->

  class EditApp extends App

    render: ->
      super

      @views.push(new EditNavigationView
        el: @$navigation
        collection: @pages
        router: @router
      .render())

      @views.push(new EditPagesView
        el: @$page
        router: @router
        band_site: @model
        player: @player
      .render())

      return this
