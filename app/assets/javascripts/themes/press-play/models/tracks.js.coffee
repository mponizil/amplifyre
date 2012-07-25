define [
  'models/collection'
  'models/track'
], (Collection, Track) ->

  class Tracks extends Collection

    constructor: ->
      super

      @index = 0
      @playing = false
      @setTrack()

      @on('play:track', @play, @)
      @on('pause:track', @pause, @)
      @on('prev:track', @prev, @)
      @on('next:track', @next, @)

    model: -> Track.create(arguments...)

    play: ->
      @playing = true

    pause: ->
      @playing = false

    prev: ->
      @index -= 1
      @index = @length-1 unless @index >= 0

      @setTrack()

    next: ->
      @index += 1
      @index = 0 unless @index < @length

      @setTrack()

    setTrack: ->
      @track = @at(@index)
      @trigger('set:track', @track, @)
