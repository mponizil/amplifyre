define [
  'underscore'
  'list'
  'ui/mirage'
  'at-pp/views/view'
  'themes/common/views/music/player/playback'
  'help!at-pp/views/music/track'
  'jst!at-pp/templates/music/album'
], (_, List, Mirage, View, PlaybackView, TrackView, jst) ->

  container =
    width: 960
    height: 960
  layers = [{
    url: '/assets/album/mirage_files/steadysun/wallpaper.png',
    width: 960,
    height: 504,
    top: 0
  }, {
    url: '/assets/album/mirage_files/steadysun/skyline.png',
    width: 960,
    height: 532,
    top: 134
  }, {
    url: '/assets/album/mirage_files/steadysun/docking.png',
    width: 960,
    height: 400,
    top: 579
  }, {
    url: '/assets/album/mirage_files/steadysun/textwork.png',
    width: 343,
    height: 346,
    top: 270
  }]

  class AlbumView extends View

    constructor: (options) ->
      super

      _.extend(@, _.pick(options, 'player'))

    template: jst

    className: 'album'

    render: ->
      super

      # TODO: Better way to implement one-off features
      if @model.get('title') is 'Good Evening'
        @views.push(new Mirage
          el: @$cover
          model: @model
          container: container
          layers: layers
        .render())
      else
        @views.push(new View
          el: @$cover
          template: -> "<img src='#{ @model.get('cover_file').url }' alt='#{ @model.get('title') }' title='#{ @model.get('title') }' />"
          model: @model
        .render())

      @views.push(new PlaybackView
        el: @$playback
        model: @player
      .render())

      TrackView = TrackView.extend
        player: @player
        tagName: 'li'
        className: 'album-track'
      @views.push(new List
        el: @$tracks
        view: TrackView
        collection: @model.tracks()
      .render())

      return this
