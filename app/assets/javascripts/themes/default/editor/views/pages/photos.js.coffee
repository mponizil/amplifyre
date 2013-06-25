define [
  'patches/fileupload'
  'themes/default/editor/views/pages/base/main'
], (Fileupload, EditPage) ->

  class EditPhotosPage extends EditPage

    inject: ->
      super
      @$el.append("<input type='file' name='photo[file]' data-ref='upload' multiple />")

    render: ->
      super

      @views.push(new Fileupload
        el: @$upload
        collection: @collection
      .render())

      return this
