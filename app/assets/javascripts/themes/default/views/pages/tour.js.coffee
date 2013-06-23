define [
  'themes/default/views/pages/base/bare'
  'help!themes/default/views/content/concert'
  'jst!themes/default/templates/pages/tour'
], (BarePage, ConcertView, jst) ->

  class TourPage extends BarePage

    template: jst

    category: 'tour'

    render: ->
      super

      @views.push(new List
        el: @$concerts
        view: ConcertView
        collection: @collection
      .render())

      return this
