define [
  'quilt'
  'jst!templates/music/music'
], (Quilt, jst) ->

  class MusicView extends Quilt.View

    initialize: ({@router, @player}) ->
      super

      @router.on('all', @route, @)
      @player.on('change:playing', @update, @)

    template: jst

    events:
      'click #prev': -> @player.set(index: @player.prev())
      'click #next': -> @player.set(index: @player.next())
      'click #play': -> @player.set(playing: true)
      'click #pause': -> @player.set(playing: false)

    render: ->
      super

      @$('#play-pause, #prev, #next').hover(
        -> $(@).animate(opacity: 1)
        -> $(@).animate(opacity: 0)
      )

      @

    update: (player, playing) ->
      if playing then @play()
      else @pause()

    play: ->
      # Sometimes it doesn't wanna hide.
      @$('#play').fadeOut -> $(@).hide()
      @$('#pause').fadeIn()

    pause: ->
      @$('#pause').fadeOut()
      @$('#play').fadeIn()

    route: (e) ->
      @$el.toggleClass('hidden', e is 'route:slug')
