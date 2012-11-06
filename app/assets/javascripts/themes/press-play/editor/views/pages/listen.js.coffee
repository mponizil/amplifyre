define [
  'quilt'
  'editor/views/pages/base'
], (Quilt, EditPageView) ->

  class ListenView extends EditPageView

    constructor: ({@player, @albums, @tracks}) ->
      super

    render: ->
      super

      @$('[data-ref=controls_left]').append($upload = $('<div>'))
      @views.push(new Quilt.View
        el: $upload
        template: -> "<input type='file' name='file' data-fileupload multiple />"
        collection: @tracks
      .render())

      return this
