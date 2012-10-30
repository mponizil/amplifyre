define [
  'list'
  'models/tracks'
  'views/pages/base'
  'views/music/singles'
  'views/music/album'
  'jst!templates/pages/listen'
], (List, Tracks, PageView, SinglesView, AlbumView, jst) ->

  class ListenView extends PageView

    constructor: ({@player, @albums}) ->
      super

    initialize: ->
      super

      @collection.on('add remove', @render, @)

    template: jst

    render: ->
      super

      if (singles = @collection.singles()).length
        @$scrollpane.prepend($singles = $('<div>'))
        $singles.append($album = $('<div>'))
        $album.addClass('album')

        @views.push(new SinglesView
          el: $album
          collection: new Tracks(singles)
          player: @player
        .render())

      @views.push(new List
        el: @$albums
        view: AlbumView.extend(player: @player)
        collection: @albums
      .render())

      @
