define [
  'backbone'
  'models/player'
  'models/band_site'
  'models/socials'
  'models/albums'
  'models/tracks'
  'models/photos'
  'models/posts'
  'models/concerts'
  'models/pages'
  'views/view'
  'views/visual/background'
  'views/links/navigation'
  'views/links/social'
  'views/music/music'
  'views/visual/ticker'
  'views/pages'
  'jst!templates/app'
  'ui/all'
  'models/associations'
  'jplayer'
  'easing'
  'fancybox'
], (Backbone, Player, BandSite, Socials, Albums, Tracks, Photos, Posts, Concerts, Pages, View, BackgroundView, NavigationView, SocialView, MusicView, TickerView, PagesView, jst) ->

  class App extends View

    initialize: ({@pages, @bootstrap, @router}) ->
      super

      @socials = @model.socials().reset(@bootstrap.socials)
      @albums = @model.albums().reset(@bootstrap.albums)
      @tracks = @model.tracks().reset(@bootstrap.tracks)
      @photos = @model.photos().reset(@bootstrap.photos)
      @posts = @model.posts().reset(@bootstrap.posts)
      @concerts = @model.concerts().reset(@bootstrap.concerts)

    template: jst

    events:
      'route a': 'route'
      'page:render': 'resize'

    render: ->
      super

      @player = new Player
        tracks: @tracks
        jplayer: @$jp_interface

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
      @views.push(new MusicView
        el: @$music
        collection: @tracks
        router: @router
        player: @player
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

      @

    route: (e, fragment) ->
      @router.navigate(fragment, true)

    resize: ->
      top = @$black_banner.offset().top - 60
      bottom = @$top_bar.offset().top + @$top_bar.height() + 20
      max_height = top - bottom

      @$page.children(':first').trigger('size:update', [max_height, bottom])
