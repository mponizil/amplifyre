define [
  'themes/common/views/app'
  'themes/default/views/music/player/playback-hover'
  'jst!themes/steady-sun/templates/app'
], (AppView, PlaybackView, jst) ->

  class SteadySunAppView extends AppView

    template: jst

    playbackView: ->
      @views.push(new PlaybackView
        el: @$playback_mini
        model: @player
        $source: @$player_mini
      .render())
