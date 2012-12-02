define [
  'ui/editable'
  'at-pp/editor/views/pages/base'
], (Editable, EditPageView) ->

  class CustomView extends EditPageView

    render: ->
      super

      @views.push(new Editable.TextArea
        el: @$body
        model: @model
        attr: 'body'
      .render())

      return this
