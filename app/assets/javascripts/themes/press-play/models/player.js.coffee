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

    active: ->
      @tracks.at(@get('index'))

    prev: ->
      index = @get('index')
      index -= 1
      index = @tracks.length-1 unless index >= 0
      index

    next: ->
      index = @get('index')
      index += 1
      index = 0 unless index < @tracks.length
      index

    setMedia: (track) ->
      @jplayer.jPlayer 'setMedia',
        m4a: '/assets/audio/' + track.get('file') + '.m4a'
        mp3: '/assets/audio/' + track.get('file') + '.mp3'

      if @get('playing')
        @jplayer.jPlayer('play')
