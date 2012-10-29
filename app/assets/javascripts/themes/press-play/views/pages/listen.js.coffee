define [
  'list'
  'views/pages/base'
  'views/music/album'
  'jst!templates/pages/listen'
], (List, PageView, AlbumView, jst) ->

  class ListenView extends PageView

    constructor: ({@player}) ->
      super

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$scrollpane
        view: AlbumView.extend(player: @player)
        collection: @collection
      .render())

      @
