define [
  'editor/views/pages/base'
  'fileupload'
], (EditPageView) ->

  class PhotosView extends EditPageView

    inject: ->
      super

      @$el.prepend(@$upload = $("<div class='edit-mode'></div>"))

    render: ->
      super

      @views.push(new Quilt.View
        el: @$upload
        template: -> "<input type='file' name='file' data-fileupload multiple />"
        collection: @collection
      .render())

      return this
