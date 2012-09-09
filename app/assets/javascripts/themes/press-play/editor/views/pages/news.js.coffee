define [
  'quilt'
], (Quilt) ->

  class NewsView extends Quilt.View

    constructor: ({@posts}) ->
      super

    render: ->
      console.log 'edit news'

      @
