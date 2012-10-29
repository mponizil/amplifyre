define [
  'quilt'
], (Quilt) ->

  class ListenView extends Quilt.View

    constructor: ({@player, @albums}) ->
      super

    render: ->
      return this
