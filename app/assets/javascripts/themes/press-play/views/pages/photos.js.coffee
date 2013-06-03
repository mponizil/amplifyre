define [
  'quilt'
  'list'
  'themes/press-play/views/pages/base/content-box'
  'help!themes/press-play/views/visual/photo'
  'jst!themes/press-play/templates/pages/photos'
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
