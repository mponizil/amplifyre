define [
  'themes/common/views/view'
  'help!themes/default/views/links/navigation'
  'themes/default/views/music/player/playback'
  'themes/default/views/music/player/ticker'
  'themes/default/views/pages'
  'jst!themes/default/templates/app'
  'themes/default/views/patches'
], (View, NavigationView, PlaybackView, TickerView, PagesView, jst) ->

  class AppView extends View

    constructor: ({@pages, @player, @router}) ->
      super

    initialize: ->
      super
      @router.on('page:change', @togglePlayer, @)

    events:
      'route a': 'navigate'

    template: jst

    navigationView: ->
      @views.push(new NavigationView
        el: @$navigation
        collection: @pages
        router: @router
      .render())

    playbackView: ->
      @views.push(new PlaybackView
        el: @$playback_mini
        model: @player
      .render())

    tickerView: ->
      @views.push(new TickerView
        el: @$ticker
        model: @player
      .render())

    pagesView: ->
      @views.push(new PagesView
        el: @$page
        router: @router
        band_site: @model
        player: @player
      .render())

    render: ->
      super
      @navigationView()
      @playbackView()
      @tickerView()
      @pagesView()
      return this

    navigate: (e, fragment) ->
      @router.navigate(fragment, true)

    togglePlayer: (page, category, slug) ->
      @$player_mini.toggleClass('hide', slug is @model.get('homepage'))
