define [
  'list'
  'models/album'
  'views/pages/base'
  'views/music/singles'
  'views/music/album'
  'jst!templates/pages/listen'
], (List, Album, PageView, SinglesView, AlbumView, jst) ->

  class ListenView extends PageView

    constructor: ({@player, @albums, @tracks}) ->
      super

    template: jst

    render: ->
      super

      @views.push(new SinglesView
        el: @$singles
        model: Album.create(id: -1)
        tracks: @tracks
        player: @player
      .render())

      @views.push(new List
        el: @$albums
        view: AlbumView.extend(player: @player)
        collection: @albums
      .render())

      return this
