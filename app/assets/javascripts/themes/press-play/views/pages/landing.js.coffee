define [
  'themes/press-play/views/pages/base/bare'
  'themes/default/views/music/player/main'
  'jst!themes/press-play/templates/pages/landing'
], (BarePage, PlayerView, jst) ->

  class LandingPage extends BarePage

    constructor: ({@player}) ->
      super

    template: jst

    category: 'landing'

    render: ->
      super

      @views.push(new PlayerView
        el: @$player
        model: @player
      .render())

      return this
