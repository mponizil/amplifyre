define [
  'list'
  'themes/steady-sun/views/pages/base/plain'
  'help!themes/steady-sun/views/music/album'
  'jst!themes/steady-sun/templates/pages/listen'
], (List, PlainPage, AlbumView, jst) ->

  class ListenPage extends PlainPage

    constructor: ({@player, @albums, @tracks}) ->
      super

    template: jst

    render: ->
      super

      $('.container:first').attr('id', 'music-page')

      @views.push(new AlbumView
        el: @$featured
        model: @albums.at(0)
        player: @player
      .render())

      return this
