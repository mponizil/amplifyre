define [
  'patches/hover'
  'themes/default/views/music/player/playback'
], (Hover, PlaybackView) ->

  class PlaybackHoverView extends PlaybackView

    render: ->
      super

      @views.push(new Hover
        el: @$el
        $source: @options.$source
        $target: @options.$target
      .render())

      return this
