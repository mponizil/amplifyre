define [
  'list'
  'themes/common/views/view'
  'help!themes/default/views/music/track'
], (List, View, TrackView) ->

  class TracksView extends View

    constructor: ({@album, @player}) ->
      @trackView = TrackView.extend({ tagName: 'li', @player })
      super

    trackView: TrackView

    render: ->
      super

      @views.push(new List
        el: @$el
        view: @trackView
        collection: @collection
      .render())

      return this
