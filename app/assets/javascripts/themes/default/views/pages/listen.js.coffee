define [
  'themes/default/views/pages/base/bare'
  'themes/default/views/music/album'
  'jst!themes/default/templates/pages/listen'
], (BarePage, AlbumView, jst) ->

  class ListenPage extends BarePage

    constructor: ({@player, @albums, @tracks}) ->
      super

    initialize: ->
      super
      @albumView = AlbumView.extend({ @player })

    template: jst

    albumView: AlbumView

    category: 'listen'

    render: ->
      super

      @views.push(new List
        el: @$albums
        collection: @albums
        view: @albumView
      .render())

      return this
