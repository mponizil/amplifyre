define [
  'at-pp/views/view'
  'jst!at-pp/templates/visual/photo'
], (View, jst) ->

  class PhotoView extends View

    initialize: ->
      super

      @model.on('change:file', @render, @)

    className: 'span2'

    tagName: 'li'

    template: jst
