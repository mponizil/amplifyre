define [
  'list'
  'views/page'
  'views/visual/photo'
  'jst!templates/pages/photos'
], (List, PageView, PhotoView, jst) ->

  class PhotosView extends PageView

    initialize: ({@photos}) ->
      super

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$pics
        view: PhotoView
        collection: @photos
      .render())

      @$('[data-fancybox]').fancybox
        helpers:
          overlay:
            css:
              'background-color': '#000'

      @
