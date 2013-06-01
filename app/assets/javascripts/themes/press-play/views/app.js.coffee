define [
  'backbone'
  'quilt'
  'at-common/models/player'
  'at-common/models/band_site'
  'at-common/models/socials'
  'at-common/models/albums'
  'at-common/models/tracks'
  'at-common/models/photos'
  'at-common/models/posts'
  'at-common/models/concerts'
  'at-common/models/pages'
  'help!at-pp/views/visual/background'
  'help!at-pp/views/links/navigation'
  'at-pp/views/links/social'
  'at-common/views/music/player/main'
  'help!at-pp/views/visual/ticker'
  'at-pp/views/pages'
  'jst!at-pp/templates/app'
  'at-pp/views/patches'
  'at-common/models/associations'
  'easing'
  'fancybox'
], (Backbone, Quilt, Player, BandSite, Socials, Albums, Tracks, Photos, Posts, Concerts, Pages, BackgroundView, NavigationView, SocialView, PlayerView, TickerView, PagesView, jst) ->

  class App extends Quilt.View

    initialize: ({@pages, @bootstrap, @router}) ->
      super

      @socials = @model.socials().reset(@bootstrap.socials)
      @albums = @model.albums().reset(@bootstrap.albums)
      @tracks = @model.tracks().reset(@bootstrap.tracks)
      @photos = @model.photos().reset(@bootstrap.photos)
      @posts = @model.posts().reset(@bootstrap.posts)
      @concerts = @model.concerts().reset(@bootstrap.concerts)

      @router.on('route', @route, @)

    template: jst

    events:
      'route a': 'navigate'
      'page:render': 'resize'

    render: ->
      super

      @player = new Player
        tracks: @tracks

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
        collection: @socials
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
      @$player.toggleClass('hide', slug.length)

    resize: ->
      top = @$marquee.offset().top - 60
      bottom = @$top_bar.offset().top + @$top_bar.height() + 20
      max_height = top - bottom

      @$page.children(':first').trigger('size:update', [max_height, bottom])
