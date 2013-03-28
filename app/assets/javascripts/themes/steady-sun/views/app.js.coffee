define [
  'themes/common/views/app'
  'themes/common/models/player'
  'help!themes/common/views/links/navigation'
  'themes/common/views/music/player/playback'
  'at-ss/views/pages'
  'jst!at-ss/templates/app'
  'at-ss/views/ui'
], (CommonApp, Player, NavigationView, PlaybackView, PagesView, jst) ->

  class App extends CommonApp

    template: jst

    render: ->
      super

      @views.push(new NavigationView
        el: @$navigation
        collection: @pages
        router: @router
      .render())

      @views.push(new PlaybackView
        el: @$playback
        collection: @tracks
        player: @player
      .render())

      @views.push(new PagesView
        el: @$page
        router: @router
        band_site: @model
        player: @player
      .render())

      return this

    route: (router, slug) ->
      page = @pages.find (page) -> page.get('slug') is slug[0]
      @$player_mini.toggleClass('hide', page.get('category') is 'listen')
