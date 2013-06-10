define [
  'themes/common/views/music/album'
  'jst!themes/default/templates/music/album'
], (BaseAlbumView, jst) ->

  class AlbumView extends BaseAlbumView

    template: jst
