define [
  'patches/hover'
  'jst!at-common/templates/music/player/playback'
], (Hover, jst) ->

  class PlaybackView extends Hover

    constructor: (options) ->
      super
      @model.on('change:playing', @update, @)

    template: jst

    events:
      'click [data-ref=play]': -> @model.set(playing: true)
      'click [data-ref=pause]': -> @model.set(playing: false)

    render: ->
      super

      @update(@model, @model.get('playing'))

      return this

    update: (model, playing) ->
      if playing then @play()
      else @pause()

    play: ->
      @$play.fadeOut => @$play.hide()
      @$pause.fadeIn()

    pause: ->
      @$pause.fadeOut => @$pause.hide()
      @$play.fadeIn()
