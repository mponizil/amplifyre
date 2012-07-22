define [
  'views/page'
  'templates/pages/photos'
], (Page, jst) ->

  class PhotosView extends Page

    template: jst

    render: ->
      super()
      $('#pics-ul a').fancybox
        overlayColor: '#000000'