define [
  'list'
  'at-ss/views/pages/base/plain'
  'help!at-ss/views/music/album'
  'at-ss/views/music/track'
  'jst!at-ss/templates/pages/listen'
], (List, PlainPage, AlbumView, TrackView, jst) ->

  class ListenPage extends PlainPage

    constructor: ({@player, @albums, @tracks}) ->
      super

    template: jst

    render: ->
      super

      $('.container:first').attr('id', 'music-page')

      @views.push(new AlbumView
        el: @$featured
        model: @albums.at(0)
        player: @player
      .render())

      trackView = TrackView.extend {tagName: 'li', @player}
      @views.push(new List
        el: @$tracks
        view: trackView
        collection: @tracks
        player: @player
      .render())

      return this
