define [
  'quilt'
  'list'
  'views/music/track'
  'jst!templates/music/album'
], (Quilt, List, TrackView, jst) ->

  class AlbumView extends Quilt.View

    template: jst

    attributes:
      class: 'album'

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

      @$('[data-fancybox]').fancybox
        helpers:
          overlay:
            css:
              'background-color': '#000'

      @
