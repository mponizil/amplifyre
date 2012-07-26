define [
  'quilt'
  'jst!templates/pages/photo'
], (Quilt, jst) ->

  class PhotosView extends Quilt.View

    tagName: 'li'

    template: jst
