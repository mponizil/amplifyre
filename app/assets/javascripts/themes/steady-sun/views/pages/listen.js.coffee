define [
  'themes/steady-sun/views/pages/base/bare'
  'help!themes/default/views/music/album'
  'jst!themes/steady-sun/templates/pages/listen'
], (BarePage, AlbumView, jst) ->

  class ListenPage extends BarePage

    constructor: ({@player, @albums, @tracks}) ->
      super

    template: jst

    category: 'listen'

    render: ->
      super

      @views.push(new AlbumView
        el: @$featured
        model: @albums.at(0)
        player: @player
      .render())

      return this
