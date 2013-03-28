define [
  'themes/common/views/app'
  'themes/common/models/player'
  'help!themes/common/views/links/navigation'
  'at-ss/views/pages'
  'jst!at-ss/templates/app'
  'at-ss/views/ui'
], (CommonApp, Player, NavigationView, PagesView, jst) ->

  class App extends CommonApp

    template: jst

    render: ->
      super

      @player = new Player {@tracks}

      @views.push(new NavigationView
        el: @$navigation
        collection: @pages
        router: @router
      .render())

      @views.push(new PagesView
        el: @$page
        router: @router
        band_site: @model
        player: @player
      .render())

      return this
