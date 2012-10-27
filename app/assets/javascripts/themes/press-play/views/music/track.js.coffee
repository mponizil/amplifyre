define [
  'ui/attr'
], (Attr) ->

  class TrackView extends Attr

    initialize: ->
      super

      @player.on('change:index', @update, @)
      @player.on('change:playing', @update, @)

    tagName: 'li'

    attributes:
      class: 'clearfix'

    attr: 'title'

    events:
      'click': 'play'

    play: ->
      index = @player.tracks.indexOf(@model)
      @player.set(index: index, playing: true)

    render: ->
      super
      @update(@player)
      @

    update: (player) ->
      track = player.active()
      playing = @model is track and player.get('playing')
      @toggle(playing)

    toggle: (playing) ->
      @$el.toggleClass('playing-bg', playing)
