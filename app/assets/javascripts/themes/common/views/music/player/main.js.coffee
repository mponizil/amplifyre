define [
  'quilt'
  'at-pp/views/music/player/playback'
  'at-pp/views/music/player/scanner'
  'jst!at-pp/templates/music/player/main'
], (Quilt, PlaybackView, ScannerView, jst) ->

  class PlayerView extends Quilt.View

    initialize: ({@player}) ->
      super

    template: jst

    render: ->
      super

      @views.push(new PlaybackView
        el: @$playback
        collection: @collection
        player: @player
      .render())
      @views.push(new ScannerView
        el: @$scanner
        collection: @collection
        player: @player
      .render())

      return this
