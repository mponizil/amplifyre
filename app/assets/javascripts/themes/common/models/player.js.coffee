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

    defaults: ->
      index: 0
      playing: false

    reset: ->
      @set(playing: false)
      @set(index: 0)

    choose: (player, index) ->
      @active = @tracks.at(index)
      @setMedia(@active)

    toggle: (player, playing) ->
      if playing
        soundManager.play(@active.id)
      else
        soundManager.pause(@active.id)

    # Get the previous index.
    prev: ->
      index = @get('index')
      index -= 1
      index = @tracks.length-1 unless index >= 0
      return index

    # Get the next index.
    next: ->
      index = @get('index')
      index += 1
      index = 0 unless index < @tracks.length
      return index

    # Tell SoundManager what to play.
    setMedia: (track) ->
      return unless track

      # TODO: analytics.js
      _gaq.push(['_trackEvent', 'Music', 'Play', "#{track.id} #{track.get('title')}"]) if _gaq

      soundObject = soundManager.createSound
        id: track.id
        url: track.get('file').url
        autoPlay: false

      # Keep playing if we were playing.
      if @get('playing')
        soundManager.stopAll()
        _.defer => soundObject.play() # HACK: woo defer!
