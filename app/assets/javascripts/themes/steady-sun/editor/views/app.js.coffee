define [
  'themes/common/views/helper-view'
], (HelperView) ->

  class EditSteadySunAppView extends HelperView

    initialize: ->
      super

      # Bootstrap some sample models where needed.
      if not @model.concerts().length
        @model.concerts().add()
