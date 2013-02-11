define [
  'quilt'
  'ui/destroy'
  'ui/fileupload'
  'ui/progress-bar'
  'ui/sortable'
  'at-pp/views/helper-view'
], (Quilt, Destroy, Fileupload, ProgressBar, Sortable, HelperView) ->

  class AlbumView extends HelperView

    initialize: ->
      super

      @model.on('change:id', @renderNested, @)

    inject: ->
      @$el.attr('data-sortable-id', @model.id)

      # For specifying Sortable `connectsWith` [1]
      @$tracks.attr('data-album-id', @model.id)

      @$tracks.append("<input type='file' name='track[file]' data-ref='upload' multiple />")

      if @model.id isnt -1
        @$cover_wrap.prepend('''
          <div class='remove'>
            <i class='icon-remove icon-white' data-ref='destroy'></i>
          </div>''')
        @$cover_wrap.prepend("<div data-ref='progress'><div>")

    render: ->
      super

      if @model.id isnt -1
        @views.push(new ProgressBar
          el: @$progress
          $target: @$cover_wrap
          model: @model
        .render())
        @views.push(new Destroy
          el: @$destroy
          model: @model
        .render())
      else
        @$el.addClass('sortable-exclude')
        @$el.removeClass('hide')

      @renderNested() if @model.id

      return this

    renderNested: ->
      @views.push(new Fileupload
        el: @$upload
        collection: @model.tracks()
        formData: 'track[album_id]': @model.id
      .render())

      @views.push(new Sortable
        el: @$tracks
        collection: @model.tracks()
        parentRef: album_id: @model.id
        label: 'tracks'
        options:
          connectWith: "[data-ref=tracks][data-album-id!=#{@model.id}]" # [1]
      .render())
