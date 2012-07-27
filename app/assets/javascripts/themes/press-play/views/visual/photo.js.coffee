define [
  'quilt'
  'jst!templates/visual/photo'
], (Quilt, jst) ->

  class PhotosView extends Quilt.View

    tagName: 'li'

    template: jst
