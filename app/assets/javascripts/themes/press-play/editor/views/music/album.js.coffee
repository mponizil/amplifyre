define [
  'quilt'
  'ui/destroy'
  'ui/fileupload'
  'ui/progress-bar'
  'ui/sortable'
  'at-pp/views/helper-view'
], (Quilt, Destroy, Fileupload, ProgressBar, Sortable, HelperView) ->

  class AlbumView extends HelperView

    inject: ->
      @$el.attr('data-sortable-id', @model.id)

      # For specifying Sortable `connectsWith` [1]
      @$tracks.attr('data-album-id', @model.id)

      @$el.append("<input type='file' name='file' data-ref='upload' multiple />")

      if @model.id isnt -1
        @$cover.prepend("<div class='delete edit-mode' data-ref='destroy'>X</div>")
        @$el.append("<div data-ref='progress'><div>")

    render: ->
      super

      if @model.id isnt -1
        @views.push(new ProgressBar
          el: @$progress
          $target: @$cover
          model: @model
        .render())
        @views.push(new Destroy
          el: @$destroy
          model: @model
        .render())
      else
        @$el.addClass('sortable-exclude')
        @$el.removeClass('hidden')

      @views.push(new Fileupload
        el: @$upload
        collection: @model.tracks()
        formData: album_id: @model.id
      .render())

      @views.push(new Sortable
        el: @$tracks
        collection: @model.tracks()
        parentRef: album_id: @model.id
        label: 'tracks'
        options:
          connectWith: "[data-ref=tracks][data-album-id!=#{@model.id}]" # [1]
      .render())

      return this
