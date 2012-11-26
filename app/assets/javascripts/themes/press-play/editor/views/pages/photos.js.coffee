define [
  'ui/fileupload'
  'editor/views/pages/base'
], (Fileupload, EditPageView) ->

  class PhotosView extends EditPageView

    inject: ->
      super

      @$el.prepend('''
        <div class='edit-mode'>
          <input type='file' name='file' data-ref='upload' multiple />
        </div>''')

    render: ->
      super

      @views.push(new Fileupload
        el: @$upload
        collection: @collection
      .render())

      return this
