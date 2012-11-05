define [
  'quilt'
  'list'
  'models/tracks'
  'views/music/track'
  'jst!templates/music/album'
], (Quilt, List, Tracks, TrackView, jst) ->

  class SinglesView extends Quilt.View

    constructor: ({@player, @tracks}) ->
      super

    initialize: ->
      super

      @tracks.on('add', @render, @)
      @tracks.on('remove', @checkDestroy, @)

    template: jst

    render: ->
      super

      if (singles = @tracks.singles()).length
        @$el.removeClass('hidden')

        TrackView = TrackView.extend
          player: @player
          tagName: 'li'
          attributes: class: 'album-track'
        @views.push(new List
          el: @$tracks
          view: TrackView
          collection: new Tracks(singles)
        .render())

        @$('[data-fancybox]').fancybox
          helpers:
            overlay:
              css:
                'background-color': '#000'
      else
        @$el.addClass('hidden')

      return this

    checkDestroy: ->
      if @tracks.singles().length is 0
        @$el.addClass('hidden')
