define [
  'themes/common/views/view'
  'themes/common/models/player'
  'themes/common/models/associations'
  'easing'
  'fancybox'
], (View, Player) ->

  class App extends View

    initialize: ({@pages, @bootstrap, @router}) ->
      super

      @socials = @model.socials().reset(@bootstrap.socials)
      @albums = @model.albums().reset(@bootstrap.albums)
      @tracks = @model.tracks().reset(@bootstrap.tracks)
      @photos = @model.photos().reset(@bootstrap.photos)
      @videos = @model.videos().reset(@bootstrap.videos)
      @posts = @model.posts().reset(@bootstrap.posts)
      @concerts = @model.concerts().reset(@bootstrap.concerts)

      @player = new Player {@tracks}

      @router.on('route', @route, @)

    events:
      'route a': 'navigate'

    navigate: (e, fragment) ->
      @router.navigate(fragment, true)
