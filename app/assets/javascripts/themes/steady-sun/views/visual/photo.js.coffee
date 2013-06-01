define [
  'at-common/views/view'
  'jst!at-ss/templates/visual/photo'
], (View, jst) ->

  class PhotoView extends View

    initialize: ->
      super
      @listenTo(@model, 'change:file', @render)

    template: jst
