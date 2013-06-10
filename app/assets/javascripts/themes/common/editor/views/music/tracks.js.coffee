define [
  'patches/fileupload'
  'patches/sortable'
  'themes/common/views/helper-view'
], (Fileupload, Sortable, HelperView) ->

  class EditTracksView extends HelperView

    inject: ->
      @$el.append("<input type='file' name='track[file]' data-ref='upload' multiple />")

    render: ->
      super

      @views.push(new Fileupload
        el: @$upload
        collection: @collection
        formData: 'track[album_id]': @album.id
      .render())

      @views.push(new Sortable
        el: @$el
        collection: @collection
        parentRef: album_id: @album.id
        label: 'tracks'
      .render())

      return this
