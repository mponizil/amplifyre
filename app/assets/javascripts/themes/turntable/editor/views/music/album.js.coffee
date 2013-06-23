define [
  'patches/editable'
  'themes/common/views/helper-view'
], (Editable, HelperView) ->

  class AlbumView extends HelperView

    render: ->
      super

      @views.push(new Editable.TextInput
        el: @$title
        model: @model
        attr: 'title'
      .render())

      return this
