define [
  'themes/press-play/editor/views/pages/base'
], (EditPageView) ->

  class NewsView extends EditPageView

    inject: ->
      super

      @$controls_right.prepend("<button type='button' class='btn' data-new-post>New Post</button>")

    events:
      'click [data-new-post]': 'newPost'
      'editor:next': 'tabNext'

    newPost: (e) ->
      e.stopPropagation()

      @$posts.one 'add', (e, $post) =>
        $post.find('[data-attr]:first').trigger('editable:start')
      @collection.create()

    tabNext: (e) ->
      $(e.target).trigger('editable:end')
      $(e.target).next('[data-attr]').trigger('editable:start')
