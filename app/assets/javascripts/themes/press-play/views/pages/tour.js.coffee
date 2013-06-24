define [
  'list'
  'themes/press-play/views/pages/base/content-box'
  'help!themes/default/views/content/concert'
  'jst!themes/press-play/templates/pages/tour'
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
