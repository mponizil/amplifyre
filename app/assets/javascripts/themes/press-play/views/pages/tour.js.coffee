define [
  'views/page'
  'jst!templates/pages/tour'
], (Page, jst) ->

  class TourView extends Page

    template: jst

    render: ->
      super()
      $('.thm a').fancybox
        overlayColor: '#000000'