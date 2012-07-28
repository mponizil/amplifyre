define [
  'quilt'
  'jst!templates/visual/ticker'
], (Quilt, jst) ->

  class TickerView extends Quilt.View

    template: jst

    initialize: ->
      super

      @duration = 5000
      @counter = 0

      @collection.on('play change:active', @reset, @)
      @collection.on('pause', @stop, @)

    reset: ->
      if @collection.isPlaying()
        clearInterval(@interval)
        @start()

    start: ->
      @counter = 0

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
        @$ticker_text.html(@collection.current().get('title'))
      else
        @$ticker_text.html(@collection.current().get('artist'))

      next()

    paused: (next) =>
      @$ticker_text.html(@model.get('tagline'))

      next()
