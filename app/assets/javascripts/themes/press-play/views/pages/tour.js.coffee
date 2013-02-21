define [
  'list'
  'at-pp/views/pages/base/content-box'
  'help!at-pp/views/content/concert'
  'jst!at-pp/templates/pages/tour'
], (List, ContentBoxPage, ConcertView, jst) ->

  class TourPage extends ContentBoxPage

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$calendar
        view: ConcertView
        collection: @collection
      .render())

      return this
