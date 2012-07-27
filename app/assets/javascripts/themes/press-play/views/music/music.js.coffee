define [
  'quilt'
  'jst!templates/music/music'
], (Quilt, jst) ->

  class MusicView extends Quilt.View

    initialize: ({@router}) ->
      super

      @collection.on('play', @play, @)
      @collection.on('pause', @pause, @)
      @collection.on('change:active', @set, @)
      @router.on('all', @route, @)

    template: jst

    events:
      'click #prev': -> @collection.prev().set(active: true)
      'click #next': -> @collection.next().set(active: true)
      'click #play': -> @collection.trigger('play')
      'click #pause': -> @collection.trigger('pause')

    render: ->
      super

      @$('#play-pause, #prev, #next').hover(
        -> $(@).animate(opacity: 1)
        -> $(@).animate(opacity: 0)
      )
      @jPlayerInit()

      @

    jPlayerInit: ->
      @$('#jp_interface').jPlayer(
        ready: => @collection.at(0).set(active: true)
        ended: => @collection.next().set(active: true)
        volume: 1
        swfPath: '/assets/jplayer'
        supplied: 'mp3, m4a'
      ).css('height', 0)

    play: ->
      # Sometimes it doesn't wanna hide.
      @$('#play').fadeOut -> $(@).hide()
      @$('#pause').fadeIn()

      @$('#jp_interface').jPlayer('play')

    pause: ->
      @$('#pause').fadeOut()
      @$('#play').fadeIn()

      @$('#jp_interface').jPlayer('pause')

    set: (track) ->
      @$('#jp_interface').jPlayer 'setMedia',
        m4a: '/assets/audio/' + track.get('file') + '.m4a'
        mp3: '/assets/audio/' + track.get('file') + '.mp3'

      if @collection.isPlaying()
        @$('#jp_interface').jPlayer('play')

    route: (e) ->
      @$el.toggleClass('hidden', e is 'route:slug')
