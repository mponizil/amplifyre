define [
  'list'
  'themes/steady-sun/views/pages/base/bare'
  'help!themes/steady-sun/views/visual/photo'
  'jst!themes/steady-sun/templates/pages/photos'
], (List, BarePage, PhotoView, jst) ->

  class PhotosPage extends BarePage

    template: jst

    category: 'photos'

    render: ->
      super

      photoView = PhotoView.extend(className: 'gallery-item')
      @views.push(new List
        el: @$photos
        view: photoView
        collection: @collection
      .render())

      return this
