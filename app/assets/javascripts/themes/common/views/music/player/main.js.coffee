define [
  'quilt'
  'at-pp/views/music/player/playback'
  'at-pp/views/music/player/scanner'
  'jst!at-pp/templates/music/player/main'
], (Quilt, PlaybackView, ScannerView, jst) ->

  class PlayerView extends Quilt.View

    template: jst

    render: ->
      super

      @views.push(new PlaybackView
        el: @$playback
        model: @model
      .render())
      @views.push(new ScannerView
        el: @$scanner
        model: @model
      .render())

      return this
