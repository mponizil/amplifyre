define [
  'list'
  'models/album'
  'views/pages/base'
  'views/music/album'
  'jst!templates/pages/listen'
  'editor/views/pages/listen'
], (List, Album, PageView, AlbumView, jst, EditListenView) ->

  class ListenView extends PageView

    constructor: ({@player, @albums, @tracks}) ->
      super

    EditView: EditListenView

    template: jst

    render: ->
      super

      @views.push(new AlbumView
        el: @$singles
        model: Album.create(id: -1)
        player: @player
      .render())

      @views.push(new List
        el: @$albums
        view: AlbumView.extend(player: @player)
        collection: @albums
        eventName: 'album'
      .render())

      return this
