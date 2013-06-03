define [
  'list'
  'themes/steady-sun/views/pages/base/bare'
  'help!themes/steady-sun/views/music/album'
  'jst!themes/steady-sun/templates/pages/listen'
], (List, BarePage, AlbumView, jst) ->

  class ListenPage extends BarePage

    constructor: ({@player, @albums, @tracks}) ->
      super

    template: jst

    category: 'music'

    render: ->
      super

      @views.push(new AlbumView
        el: @$featured
        model: @albums.at(0)
        player: @player
      .render())

      return this
