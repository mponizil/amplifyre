define [
  'editor/views/pages/base'
], (EditPageView) ->

  class TourView extends EditPageView

    controlsJst: -> '''
      <div data-edit-mode class='right'>
        <button data-new-concert>New Concert</button>
        <button class='delete' data-destroy>Delete Page</button>
      </div>
      '''

    events:
      'click [data-new-concert]': 'newPost'
      'editor:next': 'tabNext'

    newPost: (e) ->
      e.stopPropagation()

      @$('[data-ref=calendar]').one 'added', (e, $concert) =>
        $concert.find('[data-editable]:first').trigger('editable:start')
      @collection.create()

    tabNext: (e) ->
      $(e.target).trigger('editable:end')
      $(e.target).next('[data-editable]').trigger('editable:start')
