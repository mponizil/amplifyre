define [
  'list'
  'views/pages/base'
  'views/content/concert'
  'jst!templates/pages/tour'
], (List, PageView, ConcertView, jst) ->

  class TourView extends PageView

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$calendar
        view: ConcertView
        collection: @collection
      .render())

      return this
