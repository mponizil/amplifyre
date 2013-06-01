define [
  'quilt'
  'at-common/views/music/player/playback'
  'at-common/views/music/player/scanner'
  'jst!themes/common/templates/music/player/main'
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
