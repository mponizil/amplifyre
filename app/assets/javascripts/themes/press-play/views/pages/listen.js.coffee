define [
  'list'
  'views/page'
  'views/pages/album'
  'jst!templates/pages/listen'
], (List, PageView, AlbumView, jst) ->

  class ListenView extends PageView

    initialize: ({@albums}) ->
      super

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$scrollpane
        view: AlbumView
        collection: @albums
      .render())

      @
