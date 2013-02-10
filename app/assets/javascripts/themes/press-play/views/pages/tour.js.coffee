define [
  'list'
  'at-pp/views/pages/base/white-box'
  'help!at-pp/views/content/concert'
  'jst!at-pp/templates/pages/tour'
], (List, WhiteBoxPage, ConcertView, jst) ->

  class TourPage extends WhiteBoxPage

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$calendar
        view: ConcertView
        collection: @collection
      .render())

      return this
