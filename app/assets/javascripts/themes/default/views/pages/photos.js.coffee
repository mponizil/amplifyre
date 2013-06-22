define [
  'list'
  'themes/default/views/pages/base/bare'
  'help!themes/default/views/visual/photo'
  'jst!themes/default/templates/pages/photos'
], (List, BarePage, PhotoView, jst) ->

  class PhotosPage extends BarePage

    template: jst

    category: 'photos'

    render: ->
      super

      @views.push(new List
        el: @$photos
        view: PhotoView.extend(className: 'gallery-item')
        collection: @collection
      .render())

      return this
