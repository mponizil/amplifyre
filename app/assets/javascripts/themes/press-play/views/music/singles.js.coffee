define [
  'quilt'
  'list'
  'views/music/track'
  'jst!templates/music/singles'
], (Quilt, List, TrackView, jst) ->

  class SinglesView extends Quilt.View

    constructor: ({@player}) ->
      super

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$tracks
        view: TrackView.extend(player: @player)
        collection: @collection
      .render())

      @$('[data-fancybox]').fancybox
        helpers:
          overlay:
            css:
              'background-color': '#000'

      @
