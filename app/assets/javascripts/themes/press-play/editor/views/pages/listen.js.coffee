define [
  'quilt'
  'models/album'
  'editor/views/pages/base'
], (Quilt, Album, EditPageView) ->

  class ListenView extends EditPageView

    inject: ->
      super

      @$scrollpane.append(@$new_album = $('<div class="album"></div>'))

    render: ->
      super

      if not @albums.get(-1)
        Album.create(id: -1, band_site_id: @band_site.id)

      @views.push(new Quilt.View
        el: @$new_album
        template: -> '''
          <div class='album-cover album-create'>
            <input type='file' class='album-upload' name='cover_file' data-fileupload /> +
          </div>'''
        collection: @albums
      .render())

      return this
