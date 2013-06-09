define [
  'jquery'
  'themes/common/views/music/album'
  'jst!themes/turntable/templates/music/album'
], ($, BaseAlbumView, jst) ->

  class AlbumView extends BaseAlbumView

    template: jst

    render: ->
      super

      @$el.parents('[data-ref=content]').css
        'background-image': "url(#{ @model.get('cover_file').url })"

      return this
