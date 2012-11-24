define [
  'quilt'
  'ui/destroy'
  'views/helper-view'
  'jst!templates/music/upload-track'
], (Quilt, Destroy, HelperView, uploadTrackJst) ->

  class AlbumView extends HelperView

    inject: ->
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

      return this
