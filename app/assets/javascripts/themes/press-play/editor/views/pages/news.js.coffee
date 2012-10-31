define [
  'quilt'
], (Quilt) ->

  class NewsView extends Quilt.View

    render: ->
      return this

    events:
      'click [data-new-post]': 'newPost'
      'editor:next': 'tabNext'

    newPost: (e) ->
      e.stopPropagation()

      @$('[data-ref=news]').one 'added', (e, $post) =>
        $post.find('[data-editable]:first').trigger('editable:start')
      @collection.create()

    tabNext: (e) ->
      $(e.target).trigger('editable:end')
      $(e.target).next('[data-editable]').trigger('editable:start')
