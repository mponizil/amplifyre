define [
  'patches/editable'
  'themes/press-play/editor/views/pages/base'
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
