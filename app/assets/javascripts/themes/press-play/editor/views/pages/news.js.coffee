define [
  'editor/views/pages/base'
], (EditPageView) ->

  class NewsView extends EditPageView

    events:
      'click [data-ref=new_post]': 'newPost'
      'editor:next': 'tabNext'

    render: ->
      super

      @$('[data-ref=controls_right]').prepend("<button data-ref='new_post'>New Post</button>")

      return this

    newPost: (e) ->
      e.stopPropagation()

      @$('[data-ref=news]').one 'added', (e, $post) =>
        $post.find('[data-editable]:first').trigger('editable:start')
      @collection.create()

    tabNext: (e) ->
      $(e.target).trigger('editable:end')
      $(e.target).next('[data-editable]').trigger('editable:start')
