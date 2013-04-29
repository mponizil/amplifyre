# # help!viws/music/album.js.coffee
#
# Displays one album of this band.

define [
  'underscore'
  'list'
  'patches/mirage'
  'at-ss/views/view'
  'themes/common/views/music/player/playback'
  'at-ss/views/music/track'
  'jst!at-ss/templates/music/album'
], (_, List, Mirage, View, PlaybackView, TrackView, jst) ->

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
      .render())

      trackView = TrackView.extend {tagName: 'li', @player}
      @views.push(new List
        el: @$tracks
        view: trackView
        collection: @model.tracks()
      .render())

      return this
