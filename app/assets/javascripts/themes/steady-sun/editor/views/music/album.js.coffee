define [
  'quilt'
  'patches/destroy'
  'patches/fileupload'
  'patches/progress-bar'
  'patches/sortable'
  'themes/common/views/helper-view'
], (Quilt, Destroy, Fileupload, ProgressBar, Sortable, HelperView) ->

  class AlbumView extends HelperView

    inject: ->
      @$tracks.append("<input type='file' name='track[file]' data-ref='upload' multiple />")

    render: ->
      super

      @views.push(new Fileupload
        el: @$upload
        collection: @model.tracks()
        formData: 'track[album_id]': @model.id
      .render())

      return this
