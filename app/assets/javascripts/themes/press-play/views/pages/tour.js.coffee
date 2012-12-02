define [
  'list'
  'at-pp/views/pages/base'
  'at-pp/views/content/concert'
  'jst!at-pp/templates/pages/tour'
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
