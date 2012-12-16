define [
  'at-pp/views/view'
  'jst!at-pp/templates/music/album-cover'
], (View, jst) ->

  class AlbumCover extends View

    initialize: ->
      super

      @model.on('change:cover_file', @render, @)

    template: jst
