define [
  'quilt'
  'jst!themes/common/templates/music/player/playback'
], (Quilt, jst) ->

  class PlaybackView extends Quilt.View

    constructor: ->
      super
      @model.on('change:playing', @update, @)

    template: jst

    events:
      'click [data-ref=play]': -> @model.set(playing: true)
      'click [data-ref=pause]': -> @model.set(playing: false)

    render: ->
      super

      @$el.addClass('transparent')
      @$pause.addClass('hide')

      @$el.hover(
        -> $(this).animate(opacity: 1)
        -> $(this).animate(opacity: 0)
      )

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
