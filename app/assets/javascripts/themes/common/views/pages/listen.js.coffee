define [
  'themes/common/views/pages/base/bare'
], (BarePage) ->

  class ListenPage extends BarePage

    constructor: ({@player, @albums, @tracks}) ->
      super
