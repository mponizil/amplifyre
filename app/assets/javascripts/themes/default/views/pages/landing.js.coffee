define [
  'themes/default/views/pages/base/bare'
  'themes/default/views/music/player/playback'
  'jst!themes/default/templates/pages/landing'
], (BarePage, PlaybackView, jst) ->

  class LandingPage extends BarePage

    constructor: ({@player}) ->
      super

    template: jst

    category: 'landing'

    render: ->
      super

      @views.push(new PlaybackView
        el: @$playback
        model: @player
      .render())

      return this
