define [
  'backbone'
  'quilt'
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
  'views/pages'
  'jst!templates/app'
  'ui/all'
  'models/associations'
  'jplayer'
  'jquery.easing'
  'fancybox'
], (Backbone, Quilt, Player, BandSite, Socials, Albums, Tracks, Photos, Posts, Concerts, Pages, BackgroundView, NavigationView, SocialView, MusicView, TickerView, PagesView, jst) ->

  class App extends Quilt.View

    initialize: ({@bootstrap, @router}) ->
      super

      @band_site = BandSite.create(@bootstrap.band_site)
      @socials = @band_site.socials().reset(@bootstrap.socials)
      @albums = @band_site.albums().reset(@bootstrap.albums)
      @tracks = new Tracks(@bootstrap.tracks)
      @photos = @band_site.photos().reset(@bootstrap.photos)
      @posts = @band_site.posts().reset(@bootstrap.posts)
      @concerts = @band_site.concerts().reset(@bootstrap.concerts)
      @pages = @band_site.pages().reset(@bootstrap.pages)

    template: jst

    events:
      'route a': 'route'

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

      @views.push(new PagesView
        el: @$page
        router: @router
        band_site: @band_site
        player: @player
      .render())

      Backbone.history.start(pushState: true)

      $(window).resize => @resize()

      @

    route: (e, fragment) ->
      @router.navigate(fragment, true)
      @resize()

    resize: ->
      top = @$black_banner.offset().top - 60
      bottom = @$nav.offset().top + @$nav.height() + 20
      max_height = top - bottom

      @$page.children(':first').trigger('update:size', [max_height, bottom])
