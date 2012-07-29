define [
  'quilt'
  'jst!templates/visual/ticker'
], (Quilt, jst) ->

  class TickerView extends Quilt.View

    template: jst

    initialize: ({@player}) ->
      super

      @duration = 5000
      @counter = 0

      @player.on('change:index', @update, @)
      @player.on('change:playing', @reset, @)

    update: (player, index) ->
      if player.get('playing')
        @start()

    reset: (player, playing) ->
      if playing then @start()
      else @stop()

    start: ->
      @counter = 0

      clearInterval(@interval)

      @toggle(@playing)
      @interval = setInterval(
        => @toggle(@playing)
        @duration
      )

    stop: ->
      clearInterval(@interval)

      @toggle(@paused)

    toggle: (action) -> 
      @$ticker_text.fadeOut =>

        action =>

          @$ticker_text.fadeIn()
          @counter++

    playing: (next) =>
      if @counter % 2 is 0
        @$ticker_text.html(@player.active().get('title'))
      else
        @$ticker_text.html(@player.active().get('artist'))

      next()

    paused: (next) =>
      @$ticker_text.html(@model.get('tagline'))

      next()
