define [
  'list'
  'at-ss/views/pages/base/plain'
  'help!at-ss/views/visual/photo'
  'jst!at-ss/templates/pages/photos'
], (List, PlainPage, PhotoView, jst) ->

  class PhotosPage extends PlainPage

    template: jst

    render: ->
      super

      $('.container:first').attr('id', 'photos-page')

      @views.push(new List
        el: @$photos
        view: PhotoView
        collection: @collection
      .render())

      return this
