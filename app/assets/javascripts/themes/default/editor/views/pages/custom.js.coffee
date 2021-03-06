define [
  'patches/editable'
  'themes/default/editor/views/pages/base/main'
], (Editable, EditPage) ->

  class EditCustomPage extends EditPage

    render: ->
      super

      @views.push(new Editable.TextArea
        el: @$body
        model: @model
        attr: 'body'
      .render())

      return this
