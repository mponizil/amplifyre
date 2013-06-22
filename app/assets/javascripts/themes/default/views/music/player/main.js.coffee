define [
  'quilt'
  'themes/default/views/music/player/playback-hover'
  'themes/default/views/music/player/scanner'
  'jst!themes/default/templates/music/player/main'
], ({View}, PlaybackView, ScannerView, jst) ->

  class PlayerView extends View

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
