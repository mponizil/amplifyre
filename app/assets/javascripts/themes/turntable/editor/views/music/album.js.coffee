define [
  'patches/editable'
  'patches/fileupload'
  'themes/common/views/helper-view'
], (Editable, Fileupload, HelperView) ->

  class AlbumView extends HelperView

    inject: ->
      @$el.append("<input type='file' name='album[cover_file]' data-ref='cover_file' />")
      @$el.append("<div data-ref='progress'></div>")

    render: ->
      super

      @views.push(new Editable.TextInput
        el: @$title
        model: @model
        attr: 'title'
      .render())
      @views.push(new Fileupload
        el: @$cover_file
        model: @model
      .render())

      return this
