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

    initialize: ({@band_site, @pages, @bootstrap, @router}) ->
      super

      @socials = @band_site.socials().reset(@bootstrap.socials)
      @albums = @band_site.albums().reset(@bootstrap.albums)
      @tracks = new Tracks(@bootstrap.tracks)
      @photos = @band_site.photos().reset(@bootstrap.photos)
      @posts = @band_site.posts().reset(@bootstrap.posts)
      @concerts = @band_site.concerts().reset(@bootstrap.concerts)

    template: jst

    events:
      'route a': 'route'
      'page:render': 'resize'

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

      $(window).resize => @resize()

      @

    route: (e, fragment) ->
      @router.navigate(fragment, true)

    resize: ->
      top = @$black_banner.offset().top - 60
      bottom = @$nav.offset().top + @$nav.height() + 20
      max_height = top - bottom

      @$page.children(':first').trigger('size:update', [max_height, bottom])
