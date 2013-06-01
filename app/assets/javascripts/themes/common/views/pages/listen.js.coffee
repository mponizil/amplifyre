define [
  'at-common/views/pages/base/plain'
], (PlainPage) ->

  class ListenPage extends PlainPage

    constructor: ({@player, @albums, @tracks}) ->
      super
