define [
  'ui/editable'
  'ui/progress-bar'
  'ui/destroy'
  'at-pp/views/helper-view'
], (Editable, ProgressBar, Destroy, HelperView) ->

  class TrackView extends HelperView

    inject: ->
      @$el.attr('data-sortable-id', @model.id)
      @$el.append("<div class='delete edit-mode' data-ref='destroy'>X</div>")
      @$el.append("<div data-ref='progress'><div>")

    render: ->
      super

      @views.push(new Editable.TextInput
        el: @$title
        model: @model
        attr: 'title'
      .render())

      @views.push(new ProgressBar
        el: @$progress
        $target: @$el.children('span').add(@$destroy)
        model: @model
      .render())

      @views.push(new Destroy
        el: @$destroy
        model: @model
      .render())

      return this
