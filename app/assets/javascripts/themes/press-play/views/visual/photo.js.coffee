define [
  'views/view'
  'jst!templates/visual/photo'
], (View, jst) ->

  class PhotosView extends View

    tagName: 'li'

    template: jst
