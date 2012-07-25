define [
  'quilt'
  'jst!templates/ticker'
], (Quilt, jst) ->

  class TickerView extends Quilt.View

    template: jst

    initialize: ->
      super

      @duration = 5000
      @mod = 0

      @collection.on('play:track', @start, @)
      @collection.on('pause:track', @stop, @)

    toggle: (state) ->
      @$ticker_text.fadeOut =>

        if state is 'stop'
          @$ticker_text.html(@model.get('tagline'))
        else
          if @mod % 2 is 0 then @$ticker_text.html(@collection.track.get('title'))
          else @$ticker_text.html(@collection.track.get('artist'))

        @$ticker_text.fadeIn()
        @mod++

    start: ->
      @toggle('play')
      @interval = setInterval(
        => @toggle('play')
        @duration
      )

    stop: ->
      clearInterval(@interval)
      @toggle('stop')
