define [
  'themes/default/views/pages/base/bare'
  'jst!themes/default/templates/pages/listen'
], (BarePage, jst) ->

  class ListenPage extends BarePage

    constructor: ({@player, @albums, @tracks}) ->
      super

    template: jst

    category: 'listen'
