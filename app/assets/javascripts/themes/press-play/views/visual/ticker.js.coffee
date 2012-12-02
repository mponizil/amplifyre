define [
  'at-pp/views/view'
  'jst!at-pp/templates/visual/ticker'
], (View, jst) ->

  class TickerView extends View

    template: jst

    initialize: ({@player}) ->
      super

      @duration = 5000
      @counter = 0

      @player.on('change:index', @update, @)
      @player.on('change:playing', @reset, @)

    render: ->
      super

      @$ticker.addClass('hidden')
      @$phrase.removeClass('hidden')

      return this

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
      @$el.fadeOut =>

        action =>

          @$el.fadeIn()
          @counter++

    playing: (next) =>
      @$phrase.addClass('hidden')
      @$ticker.removeClass('hidden')

      if @counter % 2 is 0
        @$ticker.html(@player.active().get('title'))
      else
        @$ticker.html(@player.active().get('artist'))

      next()

    paused: (next) =>
      @$phrase.removeClass('hidden')
      @$ticker.addClass('hidden')

      next()
