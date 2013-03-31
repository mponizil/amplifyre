define [
  'underscore'
  'list'
  'ui/mirage'
  'at-ss/views/view'
  'themes/common/views/music/player/playback'
  'jst!at-ss/templates/music/album'
], (_, List, Mirage, View, PlaybackView, jst) ->

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
    top: 270,
    skip: true
  }]

  class AlbumView extends View

    constructor: (options) ->
      _.extend(@, _.pick(options, 'player'))
      super

    template: jst

    render: ->
      super

      @views.push(new Mirage
        el: @$cover
        model: @model
        maxDimensions: width: 960, height: 960
        layers: layers
      .render())

      @views.push(new PlaybackView
        el: @$playback
        model: @player
        $source: @$el
      .render())

      return this
