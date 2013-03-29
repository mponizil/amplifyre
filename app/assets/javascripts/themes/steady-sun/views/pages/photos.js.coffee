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

      photoView = PhotoView.extend
        tagName: 'a'
        attributes: ->
          'href': @model.get('file').url
          'data-fancybox-group': 'photos'

      @views.push(new List
        el: @$photos
        view: photoView
        collection: @collection
      .render())

      return this
