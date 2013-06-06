define [
  'themes/common/views/helper-view'
], (HelperView) ->

  class EditSteadySunAppView extends HelperView

    initialize: ->
      super

      # Bootstrap some sample models where needed.
      @model.concerts().add() if not @model.concerts().length
