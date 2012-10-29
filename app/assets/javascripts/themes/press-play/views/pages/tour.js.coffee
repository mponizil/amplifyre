define [
  'list'
  'views/pages/base'
  'views/content/cal-entry'
  'jst!templates/pages/tour'
], (List, PageView, CalEntryView, jst) ->

  class TourView extends PageView

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$calendar
        view: CalEntryView
        collection: @collection
      .render())

      @$('[data-fancybox]').fancybox
        helpers:
          overlay:
            css:
              'background-color': '#000'

      @
