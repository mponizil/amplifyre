define [
  'backbone'
  'quilt'
  'routers/site'
  'models/player'
  'models/band_site'
  'models/socials'
  'models/albums'
  'models/tracks'
  'models/photos'
  'models/posts'
  'models/concerts'
  'models/pages'
  'views/visual/background'
  'views/links/navigation'
  'views/links/social'
  'views/music/music'
  'views/visual/ticker'
  'jst!templates/app'
  'ui/all'
  'models/associations'
  'jplayer'
  'jquery.easing'
  'fancybox'
], (Backbone, Quilt, Site, Player, BandSite, Socials, Albums, Tracks, Photos, Posts, Concerts, Pages, BackgroundView, NavigationView, SocialView, MusicView, TickerView, jst) ->

  class App extends Quilt.View

    initialize: ({@bootstrap, @root}) ->
      super

      @band_site = new BandSite(@bootstrap.band_site)
      @socials = @band_site.socials().reset(@bootstrap.socials)
      @albums = @band_site.albums().reset(@bootstrap.albums)
      @tracks = new Tracks(@bootstrap.tracks)
      @photos = @band_site.photos().reset(@bootstrap.photos)
      @posts = @band_site.posts().reset(@bootstrap.posts)
      @concerts = @band_site.concerts().reset(@bootstrap.concerts)
      @pages = @band_site.pages().reset(@bootstrap.pages)

      @router = new Site
        app: @
        pages: @pages
      Backbone.history or= new Backbone.History()
      Backbone.history.options = {root: @root}

    template: jst

    events:
      'route a': 'route'

    route: (e, fragment) ->
      @router.navigate(fragment, true)
      @resize()

    render: ->
      super

      @player = new Player
        tracks: @tracks
        jplayer: @$('#jp_interface')

      @views.push(new BackgroundView
        el: @$background
        model: @band_site
        player: @player
      .render())
      @views.push(new NavigationView
        el: @$navigation
        collection: @pages
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
        model: @band_site
        player: @player
      .render())

      Backbone.history.start(pushState: true)

      $(window).resize => @resize()

      @

    resize: ->
      top = @$black_banner.offset().top - 60
      bottom = @$nav.offset().top + @$nav.height() + 20
      max_height = top - bottom

      @$page.children(':first').trigger('update:size', [max_height, bottom])
