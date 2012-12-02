define [
  'at-pp/views/view'
  'jst!at-pp/templates/visual/photo'
], (View, jst) ->

  class PhotosView extends View

    tagName: 'li'

    template: jst
