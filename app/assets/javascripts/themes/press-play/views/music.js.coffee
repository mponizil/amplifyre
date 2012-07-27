define [
  'quilt'
  'jst!templates/music'
], (Quilt, jst) ->

  class MusicView extends Quilt.View

    initialize: ({@router}) ->
      super

      @collection.on('play', @play, @)
      @collection.on('pause', @pause, @)
      @collection.on('set', @set, @)
      @router.on('all', @route, @)

    template: jst

    events:
      'click #prev': ->
        track = @collection.prev()
        track.trigger('set', track)
      'click #next': ->
        track = @collection.next()
        track.trigger('set', track)
      'click #play': ->
        track = @collection.current()
        track.trigger('play', track)
      'click #pause': ->
        track = @collection.current()
        track.trigger('pause', track)

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
        ready: =>
          track = @collection.at(0)
          track.trigger('set', track)
        ended: => @next()
        volume: 1
        swfPath: '/assets/jplayer'
        supplied: 'mp3, m4a'
      ).css('height', 0)

    play: ->
      @$('#play').fadeOut()
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
