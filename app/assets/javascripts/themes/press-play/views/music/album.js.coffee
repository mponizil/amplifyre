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

      @views.push(new List
        el: @$tracks
        view: TrackView.extend(player: @player)
        collection: @model.tracks()
      .render())

      @$('[data-fancybox]').fancybox
        helpers:
          overlay:
            css:
              'background-color': '#000'

      @
