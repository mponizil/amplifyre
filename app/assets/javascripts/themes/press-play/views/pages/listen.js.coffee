define [
  'list'
  'models/album'
  'views/pages/base'
  'views/music/album'
  'jst!templates/pages/listen'
], (List, Album, PageView, AlbumView, jst) ->

  class ListenView extends PageView

    constructor: ({@player, @albums, @tracks}) ->
      super

    template: jst

    render: ->
      super

      singles = @tracks.find (track) -> track.get('album_id') is -1
      if not @albums.get(-1) and singles
        Album.create(id: -1, band_site_id: @band_site.id)

      @views.push(new List
        el: @$albums
        view: AlbumView.extend(player: @player)
        collection: @albums
        eventName: 'album'
      .render())

      return this
