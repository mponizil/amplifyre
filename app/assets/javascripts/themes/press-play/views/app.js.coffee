define [
  'backbone'
  'quilt'
  'at-pp/models/player'
  'at-pp/models/band_site'
  'at-pp/models/socials'
  'at-pp/models/albums'
  'at-pp/models/tracks'
  'at-pp/models/photos'
  'at-pp/models/posts'
  'at-pp/models/concerts'
  'at-pp/models/pages'
  'help!at-pp/views/visual/background'
  'help!at-pp/views/links/navigation'
  'at-pp/views/links/social'
  'at-pp/views/music/music'
  'help!at-pp/views/visual/ticker'
  'at-pp/views/pages'
  'jst!at-pp/templates/app'
  'at-pp/views/ui'
  'at-pp/models/associations'
  'easing'
  'fancybox'
], (Backbone, Quilt, Player, BandSite, Socials, Albums, Tracks, Photos, Posts, Concerts, Pages, BackgroundView, NavigationView, SocialView, MusicView, TickerView, PagesView, jst) ->

  class App extends Quilt.View

    initialize: ({@pages, @bootstrap, @router}) ->
      super

      @socials = @model.socials().reset(@bootstrap.socials)
      @albums = @model.albums().reset(@bootstrap.albums)
      @tracks = @model.tracks().reset(@bootstrap.tracks)
      @photos = @model.photos().reset(@bootstrap.photos)
      @posts = @model.posts().reset(@bootstrap.posts)
      @concerts = @model.concerts().reset(@bootstrap.concerts)

      @router.on('all', @route, @)

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
      @views.push(new MusicView
        el: @$music
        collection: @tracks
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

      return this

    navigate: (e, fragment) ->
      @router.navigate(fragment, true)

    route: (e) ->
      @$music.toggleClass('hide', e is 'route:slug')

    resize: ->
      top = @$black_banner.offset().top - 60
      bottom = @$top_bar.offset().top + @$top_bar.height() + 20
      max_height = top - bottom

      @$page.children(':first').trigger('size:update', [max_height, bottom])
