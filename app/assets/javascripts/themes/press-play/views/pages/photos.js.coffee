define [
  'quilt'
  'list'
  'at-pp/views/pages/base'
  'help!at-pp/views/visual/photo'
  'jst!at-pp/templates/pages/photos'
], (Quilt, List, PageView, PhotoView, jst) ->

  class PhotosView extends PageView

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$photos
        view: PhotoView
        collection: @collection
      .render())

      return this
