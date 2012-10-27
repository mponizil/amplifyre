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
      'editor:next': 'tabNext'

    newPost: (e) ->
      @posts.create()
      @$('[data-editable]:first').focus()

    tabNext: (e) ->
      $(e.target).next('[data-editable]').dblclick()