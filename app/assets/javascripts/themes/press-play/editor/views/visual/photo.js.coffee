define [
  'ui/destroy'
  'views/helper-view'
], (Destroy, HelperView) ->

  class PhotoView extends HelperView

    inject: ->
      @$el.append(@$destroy = $("<div class='delete edit-mode'>X</div>"))

    render: ->
      super

      @views.push(new Destroy
        el: @$destroy
        model: @model
      .render())

      return this
