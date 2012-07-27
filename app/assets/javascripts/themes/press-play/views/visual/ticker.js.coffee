define [
  'quilt'
  'jst!templates/visual/ticker'
], (Quilt, jst) ->

  class TickerView extends Quilt.View

    template: jst

    initialize: ->
      super

      @duration = 5000
      @mod = 0

      @collection.on('play change:active', @reset, @)
      @collection.on('pause', @stop, @)

    toggle: (state) ->
      @$ticker_text.fadeOut =>

        if state is 'stop'
          @$ticker_text.html(@model.get('tagline'))
        else
          if @mod % 2 is 0 then @$ticker_text.html(@collection.current().get('title'))
          else @$ticker_text.html(@collection.current().get('artist'))

        @$ticker_text.fadeIn()
        @mod++

    reset: ->
      if @collection.isPlaying()
        clearInterval(@interval)
        @start()

    start: ->
      @mod = 0

      @toggle('play')
      @interval = setInterval(
        => @toggle('play')
        @duration
      )

    stop: ->
      clearInterval(@interval)
      @toggle('stop')
