define [
  'at-ss/views/view'
  'jst!at-ss/templates/visual/photo'
], (View, jst) ->

  class PhotoView extends View

    template: jst
