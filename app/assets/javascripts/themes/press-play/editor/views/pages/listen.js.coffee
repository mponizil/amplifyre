define [
  'editor/views/view'
], (View) ->

  class ListenView extends View

    constructor: ({@player, @albums}) ->
      super
