define [
  'list'
  'views/view'
  'views/music/track'
  'jst!templates/music/album'
], (List, View, TrackView, jst) ->

  class AlbumView extends View

    constructor: (options) ->
      super
      @player or= options.player

    template: jst

    attributes: ->
      'class': 'album'

    render: ->
      super

      TrackView = TrackView.extend
        player: @player
        tagName: 'li'
        attributes: class: 'album-track'
      @views.push(new List
        el: @$tracks
        view: TrackView
        collection: @model.tracks()
      .render())

      return this
