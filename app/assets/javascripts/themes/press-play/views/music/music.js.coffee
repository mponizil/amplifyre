define [
  'quilt'
  'jst!at-pp/templates/music/music'
], (Quilt, jst) ->

  class MusicView extends Quilt.View

    initialize: ({@router, @player}) ->
      super

      @router.on('all', @route, @)
      @player.on('change:playing', @update, @)

    template: jst

    events:
      'click [data-ref=prev]': -> @player.set(index: @player.prev())
      'click [data-ref=next]': -> @player.set(index: @player.next())
      'click [data-ref=play]': -> @player.set(playing: true)
      'click [data-ref=pause]': -> @player.set(playing: false)

    render: ->
      super

      @$play_pause.addClass('transparent')
      @$pause.addClass('hide')
      @$prev.addClass('transparent')
      @$next.addClass('transparent')

      @$('[data-ref=play_pause], [data-ref=prev], [data-ref=next]').hover(
        -> $(this).animate(opacity: 1)
        -> $(this).animate(opacity: 0)
      )

      return this

    update: (player, playing) ->
      if playing then @play()
      else @pause()

    play: ->
      # Sometimes it doesn't wanna hide.
      @$play.fadeOut -> $(this).hide()
      @$pause.fadeIn()

    pause: ->
      @$pause.fadeOut()
      @$play.fadeIn()

    route: (e) ->
      @$el.toggleClass('hide', e is 'route:slug')
