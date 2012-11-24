define [
  'ui/editable'
  'views/helper-view'
], (Editable, HelperView) ->

  class TickerView extends HelperView

    render: ->
      super

      @views.push(new Editable.TextInput
        el: @$el
        model: @model
        attr: 'phrase'
      .render())

      return this
