define [
  'quilt'
  'editor/views/pages/base'
], (Quilt, EditPageView) ->

  class ListenView extends EditPageView

    constructor: ({@player, @albums, @tracks}) ->
      super

    events:
      'added:album [data-ref=albums]': 'renderAlbum'

    render: ->
      super

      @renderSingles()

      @$('[data-ref=singles] [data-album-cover] [data-destroy]').remove()

      @$('[data-album-id]').each (i, album) => @renderAlbum(i, $(album))

      @renderNewAlbum()

      return this

    renderSingles: ->
      @$('[data-ref=singles]').removeClass('hidden').append($new_singles = $('<div>'))
      @views.push(new Quilt.View
        el: $new_singles
        template: -> "<input type='file' name='file' data-fileupload multiple />"
        collection: @tracks
      .render())

    renderAlbum: (e, $album) ->
      $album.append($new_tracks = $('<div>'))
      albumId = $album.data('album-id')
      @views.push(new Quilt.View
        el: $new_tracks
        template: -> "<input type='file' name='file' data-form-data='{\"album_id\":" + albumId + "}' data-fileupload multiple />"
        collection: @albums.get(albumId).tracks()
      .render())

    renderNewAlbum: ->
      @$('[data-ref=scrollpane]').append($new_album = $('<div>'))
      $new_album.addClass('album')
      @views.push(new Quilt.View
        el: $new_album
        template: -> '''
          <div class='album-cover album-create'>
            <input type='file' class='album-upload' name='cover_file' data-fileupload /> +
          </div>'''
        collection: @albums
      .render())
