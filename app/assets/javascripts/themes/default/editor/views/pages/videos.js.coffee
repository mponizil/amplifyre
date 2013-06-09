define [
  'patches/fileupload'
  'themes/default/editor/views/pages/base/main'
], (Fileupload, EditPage) ->

  class EditVideosPage extends EditPage

    inject: ->
      super

      @$el.append('''
        <div class='well well-small'>
          <input type='file' name='video[file]' data-ref='upload' multiple />
        </div>''')

    render: ->
      super

      @views.push(new Fileupload
        el: @$upload
        collection: @collection
      .render())

      return this
