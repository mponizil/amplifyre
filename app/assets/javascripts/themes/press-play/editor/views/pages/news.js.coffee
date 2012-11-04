define [
  'editor/views/pages/base'
], (EditPageView) ->

  class NewsView extends EditPageView

    controlsJst: -> '''
      <div data-edit-mode class='right'>
        <button data-new-post>New Post</button>
        <button class='delete' data-destroy>Delete Page</button>
      </div>
      '''

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
