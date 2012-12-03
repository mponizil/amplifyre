define [
  'list'
  'at-pp/models/album'
  'at-pp/views/pages/base'
  'help!at-pp/views/music/album'
  'jst!at-pp/templates/pages/listen'
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
