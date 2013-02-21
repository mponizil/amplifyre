define [
  'quilt'
  'list'
  'at-pp/views/pages/base/content-box'
  'help!at-pp/views/visual/photo'
  'jst!at-pp/templates/pages/photos'
], (Quilt, List, ContentBoxPage, PhotoView, jst) ->

  class PhotosPage extends ContentBoxPage

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$photos
        view: PhotoView
        collection: @collection
      .render())

      return this
