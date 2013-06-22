define [
  'patches/fileupload'
  'themes/press-play/editor/views/pages/base'
], (Fileupload, EditPage) ->

  class EditPhotosPage extends EditPage

    inject: ->
      super

      @$el.append('''
        <div class='well well-small'>
          <input type='file' name='photo[file]' data-ref='upload' multiple />
        </div>''')

    render: ->
      super

      @views.push(new Fileupload
        el: @$upload
        collection: @collection
      .render())

      return this
