define [
  'ui/destroy'
  'at-pp/views/helper-view'
], (Destroy, HelperView) ->

  class PhotoView extends HelperView

    inject: ->
      @$el.append("<div class='delete edit-mode' data-ref='destroy'>X</div>")

    render: ->
      super

      @views.push(new Destroy
        el: @$destroy
        model: @model
      .render())

      return this
