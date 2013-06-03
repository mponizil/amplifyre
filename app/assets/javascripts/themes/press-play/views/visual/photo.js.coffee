define [
  'themes/common/views/view'
  'jst!themes/press-play/templates/visual/photo'
], (View, jst) ->

  class PhotoView extends View

    initialize: ->
      super

      @model.on('change:file', @render, @)

    className: 'thumbnail'

    tagName: 'li'

    template: jst
