define [
  'editor/views/view'
], (View) ->

  class ListenView extends View

    render: ->
      super
      console.log 'rendering'
      console.log @$singles
      return this
