define [
  'quilt'
  'ui/destroy'
  'ui/sortable'
  'views/helper-view'
  'jst!editor/templates/music/upload-track'
], (Quilt, Destroy, Sortable, HelperView, uploadTrackJst) ->

  class AlbumView extends HelperView

    inject: ->
      @$el.attr('data-sortable-id', @model.id)
      @$tracks.attr('data-album-id', @model.id)
      @$el.append(@$new_tracks = $('<div>'))

      if @model.id isnt -1
        @$cover.prepend(@$destroy = $("<div class='delete edit-mode'>X</div>"))

    render: ->
      super

      if @model.id isnt -1
        @views.push(new Destroy
          el: @$destroy
          model: @model
        .render())
      else
        @$el.addClass('sortable-exclude')
        @$el.removeClass('hidden')

      UploadTrackView = Quilt.View.extend(album: @model)
      @views.push(new UploadTrackView
        el: @$new_tracks
        template: uploadTrackJst
        collection: @model.tracks()
      .render())

      @views.push(new Sortable
        el: @$tracks
        collection: @model.tracks()
        parentRef: album_id: @model.id
        label: 'tracks'
        options:
          connectWith: "[data-ref=tracks][data-album-id!=#{@model.id}]"
      .render())

      return this
