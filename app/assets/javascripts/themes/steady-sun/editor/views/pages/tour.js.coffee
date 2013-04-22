define [
  'at-ss/editor/views/pages/base/main'
], (EditPage) ->

  class EditTourPage extends EditPage

    inject: ->
      super

      @$controls_right.prepend("<button type='button' class='btn' data-new-concert>New Concert</button>")

    events:
      'click [data-new-concert]': 'newConcert'
      'editor:next': 'tabNext'

    newConcert: (e) ->
      e.stopPropagation()

      @$calendar.one 'added', (e, $concert) =>
        $concert.find('[data-attr]:first').trigger('editable:start')
      @collection.create()

    tabNext: (e) ->
      $(e.target).trigger('editable:end')
      $(e.target).next('[data-attr]').trigger('editable:start')
