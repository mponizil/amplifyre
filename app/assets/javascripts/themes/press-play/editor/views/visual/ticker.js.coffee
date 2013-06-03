define [
  'patches/editable'
  'themes/common/views/helper-view'
], (Editable, HelperView) ->

  class TickerView extends HelperView

    render: ->
      super

      @views.push(new Editable.TextInput
        el: @$phrase
        model: @model
        attr: 'phrase'
      .render())

      return this
