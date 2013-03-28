define [
  'list'
  'themes/common/models/album'
  'at-pp/views/pages/base/plain'
  'help!at-pp/views/music/album'
  'jst!at-pp/templates/pages/listen'
], (List, Album, PlainPage, AlbumView, jst) ->

  class ListenPage extends PlainPage

    constructor: ({@player, @albums, @tracks}) ->
      super

    template: jst

    render: ->
      super

      singles = @tracks.find (track) -> track.get('album_id') is -1
      if not @albums.get(-1) and singles
        Album.createSingles(band_site_id: @band_site.id)

      @views.push(new List
        el: @$albums
        view: AlbumView.extend(player: @player)
        collection: @albums
        eventName: 'album'
      .render())

      @align(); $(window).on('resize', @align)

      return this

    align: (e) =>
      windowWidth = $(window).width()
      marginLeft = windowWidth / 2 - 830 / 2
      @$('.album').css('margin-left', marginLeft)

      albumCount = @$('.album').length
      @$el.css('width', albumCount * (marginLeft + 830))
