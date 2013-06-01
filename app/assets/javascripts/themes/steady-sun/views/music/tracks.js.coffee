define [
  'list'
  'at-common/views/view'
  'help!at-ss/views/music/track'
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
