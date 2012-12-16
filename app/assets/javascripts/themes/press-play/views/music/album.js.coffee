define [
  'list'
  'at-pp/views/view'
  'at-pp/views/music/album-cover'
  'help!at-pp/views/music/track'
  'jst!at-pp/templates/music/album'
], (List, View, AlbumCoverView, TrackView, jst) ->

  class AlbumView extends View

    constructor: (options) ->
      super
      @player or= options.player

    template: jst

    attributes: ->
      'class': 'album'

    render: ->
      super

      @views.push(new AlbumCoverView
        el: @$cover
        model: @model
      .render())
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
