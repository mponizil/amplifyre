define [
  'backbone'
  'quilt'
  'routers/site'
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
], (Backbone, Quilt, Site, BandSite, Socials, Albums, Tracks, Photos, Posts, Concerts, Pages, BackgroundView, NavigationView, SocialView, MusicView, TickerView, jst) ->

  class App extends Quilt.View

    template: jst

    initialize: ->
      super

      data = JSON.parse($('#bootstrap').html())

      @band_site = new BandSite(data.band_site)
      @socials = new Socials(data.socials)
      @albums = new Albums(data.albums)
      @tracks = new Tracks(data.tracks)
      @photos = new Photos(data.photos)
      @posts = new Posts(data.posts)
      @concerts = new Concerts(data.concerts)
      @pages = new Pages(data.pages)

      @router = new Site
        app: @
        pages: @pages
      Backbone.history or= new Backbone.History()
      Backbone.history.options = {root: '/'}

    events:
      'route a': 'route'

    route: (e, fragment) ->
      @router.navigate(fragment, true)

    render: ->
      super

      @views.push(new BackgroundView
        el: @$background
        model: @band_site
        tracks: @tracks
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
      .render())
      @views.push(new TickerView
        el: @$ticker
        model: @band_site
        collection: @tracks
      .render())

      Backbone.history.start(pushState: true)

      @resize()
      $(window).resize => @resize()

      @

    resize: ->
      top = @$black_banner.offset().top - 60
      bottom = @$nav.offset().top + @$nav.height() + 20
      max_height = top - bottom

      @$page.children(':first').trigger('window:resize', [max_height, bottom])
