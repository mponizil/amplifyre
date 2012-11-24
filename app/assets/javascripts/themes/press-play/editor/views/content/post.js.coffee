define [
  'ui/editable'
  'ui/destroy'
  'views/helper-view'
], (Editable, Destroy, HelperView) ->

  class PostView extends HelperView

    inject: ->
      @$el.prepend(@$destroy = $("<div class='right delete edit-mode'>Delete</div>"))

    render: ->
      super

      @views.push(new Editable.TextInput
        el: @$title
        model: @model
        attr: 'title'
      .render())

      @views.push(new Editable.TextArea
        el: @$body
        model: @model
        attr: 'body'
      .render())

      @views.push(new Destroy
        el: @$destroy
        model: @model
      .render())

      return this
