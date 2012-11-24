define [
  'editor/views/pages/base'
  'fileupload'
], (EditPageView) ->

  class PhotosView extends EditPageView

    inject: ->
      super

      @$el.prepend @$upload = $('''
        <div class='edit-mode'>
          <input type='file' name='file' data-fileupload multiple />
        </div>''')

    render: ->
      super

      @views.push(new Quilt.View
        el: @$upload
        collection: @collection
      .render())

      return this
