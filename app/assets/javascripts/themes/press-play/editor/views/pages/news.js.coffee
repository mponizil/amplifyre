define [
  'quilt'
], (Quilt) ->

  class NewsView extends Quilt.View

    constructor: ({@posts}) ->
      super

    render: ->
      @

    events:
      'click [data-new-post]': 'newPost'

    newPost: (e) ->
      console.log 'new post'
