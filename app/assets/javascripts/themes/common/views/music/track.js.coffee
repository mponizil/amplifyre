# # help!views/music/track.js.coffee
#
# Displays one track.

define [
  'themes/common/views/view'
], (View) ->

  class TrackView extends View

    initialize: ->
      super

      @player.on('change:index', @update, @)
      @player.on('change:playing', @update, @)

    events:
      'click': 'play'

    play: ->
      index = @player.tracks.indexOf(@model)
      @player.set(index: index, playing: true)

    render: ->
      super
      @update(@player)
      return this

    update: (player) ->
      track = player.active()
      playing = @model is track and player.get('playing')
      @toggle(playing)

    toggle: (playing) ->
      @$el.toggleClass('active', playing)
