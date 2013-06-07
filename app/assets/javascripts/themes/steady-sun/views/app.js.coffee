define [
  'themes/common/views/app'
  'help!themes/default/views/links/navigation'
  'themes/default/views/music/player/playback-hover'
  'themes/default/views/music/player/ticker'
  'themes/default/views/pages'
  'jst!themes/steady-sun/templates/app'
  'themes/default/views/patches'
], (AppView, NavigationView, PlaybackView, TickerView, PagesView, jst) ->

  class SteadySunAppView extends AppView

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
