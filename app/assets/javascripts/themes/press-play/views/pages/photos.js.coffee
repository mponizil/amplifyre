define [
  'list'
  'views/page'
  'views/pages/photo'
  'jst!templates/pages/photos'
], (List, PageView, PhotoView, jst) ->

  class PhotosView extends PageView

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$pics
        view: PhotoView
        collection: @collection
      .render())

      @$('a').fancybox
        overlayColor: '#000000'

      @
