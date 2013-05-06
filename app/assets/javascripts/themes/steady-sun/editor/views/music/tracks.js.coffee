define [
  'patches/fileupload'
  'themes/common/views/helper-view'
], (Fileupload, HelperView) ->

  class TracksView extends HelperView

    inject: ->
      @$el.append("<input type='file' name='track[file]' data-ref='upload' multiple />")

    render: ->
      super

      @views.push(new Fileupload
        el: @$upload
        collection: @collection
        formData: 'track[album_id]': @album.id
      .render())

      return this
