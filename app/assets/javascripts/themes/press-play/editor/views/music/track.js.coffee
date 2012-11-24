define [
  'ui/destroy'
  'views/helper-view'
], (Destroy, HelperView) ->

  class TrackView extends HelperView

    inject: ->
      @$el.attr('data-sortable-id', @model.id)
      @$el.append(@$destroy = $("<div class='delete edit-mode'>X</div>"))

    render: ->
      super

      @views.push(new Destroy
        el: @$destroy
        model: @model
      .render())

      return this
