define [
  'underscore'
  'themes/common/views/view'
  'help!themes/default/views/music/tracks'
], (_, View, TracksView) ->

  class AlbumView extends View

    constructor: (options) ->
      _.extend(@, _.pick(options, 'player'))
      super

    render: ->
      super

      @views.push(new TracksView
        el: @$tracks
        collection: @model.tracks()
        album: @model
        player: @player
      .render())

      return this
