define [
  'list'
  'themes/common/views/view'
  'help!themes/steady-sun/views/music/track'
], (List, View, TrackView) ->

  class Tracks extends View

    constructor: ({@album, @player}) ->
      super

    render: ->
      super

      trackView = TrackView.extend {tagName: 'li', @player}
      @views.push(new List
        el: @$el
        view: trackView
        collection: @collection
      .render())

      return this
