define [
  'quilt'
  'jst!themes/default/templates/music/player/playback'
], ({View}, jst) ->

  class PlaybackView extends View

    constructor: (options={}) ->
      super
      @listenTo(@model, 'change:playing', @update)

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
