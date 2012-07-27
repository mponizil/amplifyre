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
      @on('change:active', @set, @)

    model: -> Track.create(arguments...)

    play: ->
      @playing = true

    pause: ->
      @playing = false

    set: (track) ->
      return unless track.get('active')

      @track?.set(active: false)

      @index = @indexOf(track)
      @track = track

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
