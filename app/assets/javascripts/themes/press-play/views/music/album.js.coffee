define [
  'quilt'
  'list'
  'views/music/track'
  'jst!templates/music/album'
], (Quilt, List, TrackView, jst) ->

  class AlbumView extends Quilt.View

    constructor: (options) ->
      super
      @player or= options.player

    template: jst

    attributes: ->
      'class': 'album'
      'data-album-id': @model.get('id')

    render: ->
      super

      @$el.addClass('hidden') if @model.emptySingles()

      TrackView = TrackView.extend
        player: @player
        tagName: 'li'
        attributes: class: 'album-track'
      @views.push(new List
        el: @$tracks
        view: TrackView
        collection: @model.tracks()
      .render())

      @$('[data-fancybox]').fancybox
        helpers:
          overlay:
            css:
              'background-color': '#000'

      return this
