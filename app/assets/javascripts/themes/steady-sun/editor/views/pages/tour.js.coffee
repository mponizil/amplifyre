define [
  'at-ss/editor/views/pages/base/main'
], (EditPage) ->

  class EditTourPage extends EditPage

    inject: ->
      super

      @$controls_left.append('''
        <button type='button' class='btn' data-new-concert>New Concert</button>
      ''')

    events:
      'click [data-new-concert]': 'newConcert'
      'editor:next': 'tabNext'

    newConcert: (e) ->
      e.stopPropagation()

      @$next_show.one 'added', (e, $concert) =>
        $concert.find('[data-attr]:first').trigger('editable:start')
      @collection.add()

    tabNext: (e) ->
      $(e.target).trigger('editable:end')
      $(e.target).next('[data-attr]').trigger('editable:start')
