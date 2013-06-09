define [
  'themes/default/editor/views/pages/base/main'
], (EditPage) ->

  class EditNewsPage extends EditPage

    inject: ->
      super

      @$el.prepend('''
        <div class='well well-editor'>
          <button type='button' class='btn' data-new-post>New Post</button>
        </div>
      ''')

    events:
      'click [data-new-post]': 'newPost'
      'editor:next': 'tabNext'

    newPost: (e) ->
      e.stopPropagation()

      @$posts.one 'added', (e, $post) =>
        $post.find('[data-attr]:first').trigger('editable:start')
      @collection.create()

    tabNext: (e) ->
      $(e.target).trigger('editable:end')
      $(e.target).next('[data-attr]').trigger('editable:start')
