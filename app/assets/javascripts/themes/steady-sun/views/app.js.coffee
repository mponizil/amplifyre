define [
  'at-common/views/app'
  'at-common/models/player'
  'help!at-common/views/links/navigation'
  'at-common/views/music/player/playback'
  'at-common/views/music/player/ticker'
  'at-ss/views/pages'
  'jst!at-ss/templates/app'
  'at-ss/views/patches'
], (CommonApp, Player, NavigationView, PlaybackView, TickerView, PagesView, jst) ->

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
        model: @player
        $source: @$player_mini
      .render())
      @views.push(new TickerView
        el: @$ticker
        model: @player
      .render())

      @views.push(new PagesView
        el: @$page
        router: @router
        band_site: @model
        player: @player
      .render())

      return this

    # TODO: cleanup
    route: (router, slug) ->
      page = @pages.findWhere(slug: slug[0])
      category = page?.get('category') or @pages.homepage().get('category')
      @$player_mini.toggleClass('hide', category is 'listen')
