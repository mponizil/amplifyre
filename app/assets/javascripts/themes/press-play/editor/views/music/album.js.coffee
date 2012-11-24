define [
  'quilt'
  'views/helper-view'
  'jst!templates/music/upload-track'
], (Quilt, HelperView, uploadTrackJst) ->

  class AlbumView extends HelperView

    inject: ->
      @$el.append(@$new_tracks = $('<div>'))

    render: ->
      super

      @$('[data-album-cover] [data-destroy]').remove() if @model.id is -1

      if @model.get('id') is -1
        @$el.removeClass('hidden')

      UploadTrackView = Quilt.View.extend(album: @model)
      @views.push(new UploadTrackView
        el: @$new_tracks
        template: uploadTrackJst
        collection: @model.tracks()
      .render())

      return this
