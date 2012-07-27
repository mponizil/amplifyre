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

      @collection.on('play', @start, @)
      @collection.on('pause', @stop, @)
      @collection.on('set', @reset, @)

    toggle: (state) ->
      @$ticker_text.fadeOut =>

        if state is 'stop'
          @$ticker_text.html(@model.get('tagline'))
        else
          if @mod % 2 is 0 then @$ticker_text.html(@collection.current().get('title'))
          else @$ticker_text.html(@collection.current().get('artist'))

        @$ticker_text.fadeIn()
        @mod++

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

    reset: ->
      if @collection.isPlaying()
        clearInterval(@interval)
        @start()
