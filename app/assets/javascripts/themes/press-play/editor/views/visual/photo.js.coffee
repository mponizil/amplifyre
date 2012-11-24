define [
  'views/helper-view'
], (HelperView) ->

  class PhotoView extends HelperView

    inject: ->
      @$el.append("<div class='delete edit-mode' data-destroy>X</div>")
