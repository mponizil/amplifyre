define [
  'editor/views/pages/base'
], (EditPageView) ->

  class TourView extends EditPageView

    events:
      'click [data-ref=new_concert]': 'newConcert'
      'editor:next': 'tabNext'

    render: ->
      super

      @$('[data-ref=controls_right]').prepend("<button data-ref='new_concert'>New Concert</button>")

      return this

    newConcert: (e) ->
      e.stopPropagation()

      @$('[data-ref=calendar]').one 'added', (e, $concert) =>
        $concert.find('[data-editable]:first').trigger('editable:start')
      @collection.create()

    tabNext: (e) ->
      $(e.target).trigger('editable:end')
      $(e.target).next('[data-editable]').trigger('editable:start')
