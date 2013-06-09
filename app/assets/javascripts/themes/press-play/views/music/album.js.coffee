define [
  'themes/common/views/view'
  'themes/common/views/music/album'
  'themes/default/views/music/player/playback'
  'help!themes/press-play/views/music/track'
  'jst!themes/press-play/templates/music/album'
  'jst!themes/default/templates/music/cover'
], (View, BaseAlbumView, PlaybackView, TrackView, jst, coverJst) ->

  class AlbumView extends BaseAlbumView

    initialize: ->
      super
      @trackView = TrackView.extend
        player: @player
        tagName: 'li'
        className: 'album-track'

    template: jst

    render: ->
      super

      @views.push(new View
        el: @$cover
        template: coverJst
        model: @model
      .render())

      @views.push(new PlaybackView
        el: @$playback
        model: @player
      .render())

      return this
