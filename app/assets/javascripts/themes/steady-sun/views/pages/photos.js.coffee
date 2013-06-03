define [
  'list'
  'themes/steady-sun/views/pages/base/plain'
  'help!themes/steady-sun/views/visual/photo'
  'jst!themes/steady-sun/templates/pages/photos'
], (List, PlainPage, PhotoView, jst) ->

  class PhotosPage extends PlainPage

    template: jst

    render: ->
      super

      $('.container:first').attr('id', 'photos-page')

      photoView = PhotoView.extend(className: 'gallery-item')
      @views.push(new List
        el: @$photos
        view: photoView
        collection: @collection
      .render())

      return this
