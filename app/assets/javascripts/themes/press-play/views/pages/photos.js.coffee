define [
  'quilt'
  'list'
  'at-pp/views/pages/base/white-box'
  'help!at-pp/views/visual/photo'
  'jst!at-pp/templates/pages/photos'
], (Quilt, List, WhiteBoxPage, PhotoView, jst) ->

  class PhotosPage extends WhiteBoxPage

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$photos
        view: PhotoView
        collection: @collection
      .render())

      return this
