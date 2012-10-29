define [
  'list'
  'models/album'
  'views/pages/base'
  'views/music/album'
  'jst!templates/pages/listen'
], (List, Album, PageView, AlbumView, jst) ->

  class ListenView extends PageView

    constructor: ({@player, @albums}) ->
      super

    template: jst

    render: ->
      super

      AlbumView = AlbumView.extend(player: @player)

      if singles = @collection.singles().length
        album = Album.create()
        album.tracks().reset(@collection.singles())
        @views.push(new AlbumView
          el: @$singles_album
          model: album
        .render())

      @views.push(new List
        el: @$albums
        view: AlbumView
        collection: @albums
      .render())

      @
