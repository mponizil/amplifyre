define [
  'themes/common/models/album'
  'patches/fileupload'
  'patches/sortable'
  'themes/press-play/editor/views/pages/base'
], (Album, Fileupload, Sortable, EditPage) ->

  class EditListenPage extends EditPage

    inject: ->
      super

      @$albums.append """
        <div class='album'>
          <div class='album-cover album-create'>
            <input type='file' class='album-upload' name='album[cover_file]' data-ref='upload' /> +
          </div>
        </div>"""

    render: ->
      super

      if not @albums.get(-1)
        Album.createSingles(band_site_id: @band_site.id)

      @views.push(new Sortable
        el: @$albums
        collection: @albums
        label: 'albums'
      .render())

      @views.push(new Fileupload
        el: @$upload
        collection: @albums
      .render())

      return this
