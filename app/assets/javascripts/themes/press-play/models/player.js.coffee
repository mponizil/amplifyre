define [
  'backbone'
], (Backbone) ->

  class Player extends Backbone.Model

    initialize: ({@tracks, @jplayer}) ->
      super

      # Initialize jPlayer.
      @jplayer.jPlayer(
        ready: => @choose(@, 0)
        ended: => @set(index: @next())
        volume: 1
        swfPath: '/assets/jplayer'
        supplied: 'mp3, m4a'
      ).css('height', 0)

      @on('change:index', @choose, @)
      @on('change:playing', @toggle, @)

    defaults:
      index: 0
      playing: false

    choose: (player, index) ->
      track = @tracks.at(index)
      @setMedia(track)

    toggle: (player, playing) ->
      if playing
        @jplayer.jPlayer('play')
      else
        @jplayer.jPlayer('pause')

    # Retreive the active track according to `index`.
    active: ->
      @tracks.at(@get('index'))

    # Get the previous index.
    prev: ->
      index = @get('index')
      index -= 1
      index = @tracks.length-1 unless index >= 0
      index

    # Get the next index.
    next: ->
      index = @get('index')
      index += 1
      index = 0 unless index < @tracks.length
      index

    # Tell jPlayer what to play.
    setMedia: (track) ->
      @jplayer.jPlayer 'setMedia',
        m4a: '/assets/audio/' + track.get('file') + '.m4a'
        mp3: '/assets/audio/' + track.get('file') + '.mp3'

      # Keep playing if we were playing.
      if @get('playing')
        @jplayer.jPlayer('play')
