define [
  'quilt'
  'list'
  'views/pages/base'
  'views/visual/photo'
  'jst!templates/pages/photos'
], (Quilt, List, PageView, PhotoView, jst) ->

  class PhotosView extends PageView

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$pics
        view: PhotoView
        collection: @collection
      .render())

      @$('[data-fancybox]').fancybox
        helpers:
          overlay:
            css:
              'background-color': '#000'

      @
