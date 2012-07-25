define [
  'backbone'
  'quilt'
  'routers/site'
  'models/band_site'
  'models/socials'
  'models/albums'
  'models/tracks'
  'models/posts'
  'models/concerts'
  'models/pages'
  'views/background'
  'views/navigation'
  'views/social'
  'views/music'
  'views/ticker'
  'jst!templates/app'
  'ui/all'
  'jplayer'
  'jquery.easing'
], (Backbone, Quilt, Site, BandSite, Socials, Albums, Tracks, Posts, Concerts, Pages, BackgroundView, NavigationView, SocialView, MusicView, TickerView, jst) ->

  class App extends Quilt.View

    template: jst

    initialize: ->
      super

      data = JSON.parse($('#bootstrap').html())

      @band_site = new BandSite(data.band_site)
      @socials = new Socials(data.socials)
      @albums = new Albums(data.albums)
      @tracks = new Tracks(data.tracks)
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

      @
