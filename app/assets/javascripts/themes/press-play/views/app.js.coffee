define [
  'themes/common/views/app'
  'help!themes/press-play/views/visual/background'
  'help!themes/press-play/views/links/navigation'
  'themes/press-play/views/links/social'
  'themes/default/views/music/player/main'
  'help!themes/press-play/views/visual/ticker'
  'themes/default/views/pages'
  'jst!themes/press-play/templates/app'
  'themes/default/views/patches'
], (AppView, BackgroundView, NavigationView, SocialView, PlayerView, TickerView, PagesView, jst) ->

  class PressPlayAppView extends AppView

    template: jst

    events:
      'route a': 'navigate'
      'page:render': 'resize'

    render: ->
      super

      @views.push(new BackgroundView
        el: @$background
        model: @model
        player: @player
      .render())
      @views.push(new NavigationView
        el: @$navigation
        collection: @pages
        router: @router
      .render())
      @views.push(new SocialView
        el: @$social
        collection: @model.socials()
      .render())
      @views.push(new PlayerView
        el: @$player
        model: @player
      .render())
      @views.push(new TickerView
        el: @$ticker
        model: @model
        player: @player
      .render())

      @views.push(new PagesView
        el: @$page
        router: @router
        band_site: @model
        player: @player
      .render())

      $(window).resize => @resize()

      return this

    navigate: (e, fragment) ->
      @router.navigate(fragment, true)

    route: (router, slug) ->
      @$player.toggleClass('hide', !!slug.length)

    resize: ->
      top = @$marquee.offset().top - 60
      bottom = @$top_bar.offset().top + @$top_bar.height() + 20
      max_height = top - bottom

      @$page.children(':first').trigger('size:update', [max_height, bottom])
