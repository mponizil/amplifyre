define [
  'underscore'
  'list'
  'themes/common/views/view'
  'themes/default/views/music/track'
  'jst!themes/default/templates/music/album'
  'jst!themes/default/templates/music/cover'
], (_, List, View, TrackView, jst) ->

  class AlbumView extends View

    constructor: (options) ->
      _.extend(@, _.pick(options, 'player'))
      super

    initialize: ->
      super
      @trackView = TrackView.extend({ @player, tagName: 'li' })

    template: jst

    trackView: TrackView

    render: ->
      super

      @views.push(new View
        el: @$cover
        template: coverJst
        model: @model
      .render())

      @views.push(new List
        el: @$tracks
        collection: @model.tracks()
        view: @trackView
      .render())

      return this
