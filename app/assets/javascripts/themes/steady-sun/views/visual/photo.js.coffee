define [
  'themes/common/views/view'
  'jst!themes/steady-sun/templates/visual/photo'
], (View, jst) ->

  class PhotoView extends View

    initialize: ->
      super
      @listenTo(@model, 'change:file', @render)

    template: jst
