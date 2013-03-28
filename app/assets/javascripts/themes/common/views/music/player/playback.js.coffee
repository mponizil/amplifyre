define [
  'quilt'
  'jst!themes/common/templates/music/player/playback'
], (Quilt, jst) ->

  class PlaybackView extends Quilt.View

    initialize: ({@player}) ->
      super

      @player.on('change:playing', @update, @)

    template: jst

    events:
      'click [data-ref=play]': -> @player.set(playing: true)
      'click [data-ref=pause]': -> @player.set(playing: false)

    render: ->
      super

      @$el.addClass('transparent')
      @$pause.addClass('hide')

      @$el.hover(
        -> $(this).animate(opacity: 1)
        -> $(this).animate(opacity: 0)
      )

      @update(@player, @player.get('playing'))

      return this

    update: (player, playing) ->
      if playing then @play()
      else @pause()

    play: ->
      @$play.fadeOut => @$play.hide()
      @$pause.fadeIn()

    pause: ->
      @$pause.fadeOut => @$pause.hide()
      @$play.fadeIn()
