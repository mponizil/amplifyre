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
  'views/navigation'
  'views/social'
  'views/music'
  'views/ticker'
  'jst!templates/app'
  'ui/all'
], (Backbone, Quilt, Site, BandSite, Socials, Albums, Tracks, Posts, Concerts, Pages, NavigationView, SocialView, MusicView, TickerView, jst) ->

  class App extends Quilt.View

    template: jst

    initialize: ->
      super

      @router = new Site(app: @)

      data = JSON.parse($('#bootstrap').html())

      @band_site = new BandSite(data.band_site)
      @socials = new Socials(data.socials)
      @albums = new Albums(data.albums)
      @tracks = new Tracks(data.tracks)
      @posts = new Posts(data.posts)
      @concerts = new Concerts(data.concerts)
      @pages = new Pages(data.pages)

      Backbone.history or= new Backbone.History()
      Backbone.history.options = {root: '/'}

    events:
      'route a': 'route'

    route: (e, fragment) ->
      @router.navigate(fragment, true)

    render: ->
      super
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
      .render())
      @views.push(new TickerView
        el: @$ticker
        collection: @tracks
      .render())
      @
