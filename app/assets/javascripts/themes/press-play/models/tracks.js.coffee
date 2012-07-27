define [
  'models/collection'
  'models/track'
], (Collection, Track) ->

  class Tracks extends Collection

    initialize: ->
      @index = 0
      @playing = false

      @on('play', @play, @)
      @on('pause', @pause, @)
      @on('set', @set, @)

    model: -> Track.create(arguments...)

    play: ->
      @playing = true

    pause: ->
      @playing = false

    isPlaying: ->
      @playing

    current: ->
      @at(@index)

    prev: ->
      @index -= 1
      @index = @length-1 unless @index >= 0

      @at(@index)

    next: ->
      @index += 1
      @index = 0 unless @index < @length

      @at(@index)

    set: (track) ->
      @track?.trigger('stop')

      @index = @indexOf(track)
      @track = track
