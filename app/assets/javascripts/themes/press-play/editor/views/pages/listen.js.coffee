define [
  'editor/views/pages/base'
  'editor/views/music/tracks-uploader'
], (EditPageView, TracksUploaderView) ->

  class ListenView extends EditPageView

    constructor: ({@player, @albums, @tracks}) ->
      super

    controlsJst: -> '''
      <div class='left' data-ref='tracks_uploader'>
      </div>
      <div class='right'>
        <button class='delete' data-destroy>Delete Page</button>
      </div>
      '''

    render: ->
      super

      @views.push(new TracksUploaderView
        el: @$('[data-ref=tracks_uploader]')
        collection: @tracks
      .render())

      return this
