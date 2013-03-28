define [
  'backbone'
  'soundmanager2'
], (Backbone, soundManager) ->

  class Player extends Backbone.Model

    initialize: ({@tracks}) ->
      super

      soundManager.setup
        url: '/assets/soundmanager2'
        onready: => @choose(this, 0)
        defaultOptions:
          onfinish: => @set(index: @next())

      @tracks.on('add remove', @reset, @)
      @on('change:index', @choose, @)
      @on('change:playing', @toggle, @)

    defaults:
      index: 0
      playing: false

    reset: ->
      @choose(this, @get('index'))
      @set(playing: false)

    choose: (player, index) ->
      track = @tracks.at(index)
      @setMedia(track)

    toggle: (player, playing) ->
      if playing
        soundManager.play(@active().id)
      else
        soundManager.pause(@active().id)

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
      return unless track

      soundObject = soundManager.createSound
        id: track.id
        url: track.get('file').url
        autoPlay: false

      # Keep playing if we were playing.
      if @get('playing')
        soundManager.stopAll()
        soundObject.play()
