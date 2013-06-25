define [
  'jquery'
  'themes/common/views/music/album'
  'jst!themes/turntable/templates/music/album'
], ($, BaseAlbumView, jst) ->

  class AlbumView extends BaseAlbumView

    initialize: ->
      super
      @listenTo(@model, 'change:cover_file', @renderCoverFile)

    template: jst

    render: ->
      super
      @renderCoverFile()
      return this

    renderCoverFile: ->
      @$el.parents('[data-ref=content]').css
        'background-image': "url(#{ @model.get('cover_file').url })"
