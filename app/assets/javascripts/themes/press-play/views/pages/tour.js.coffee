define [
  'list'
  'views/page'
  'views/content/cal-entry'
  'jst!templates/pages/tour'
], (List, PageView, CalEntryView, jst) ->

  class TourView extends PageView

    initialize: ({@concerts}) ->
      super

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$calendar
        view: CalEntryView
        collection: @concerts
      .render())

      @$('[data-fancybox]').fancybox
        helpers:
          overlay:
            css:
              'background-color': '#000'

      @
