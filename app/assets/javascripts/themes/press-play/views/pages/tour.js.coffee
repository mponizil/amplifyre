define [
  'views/page'
  'jst!templates/pages/tour'
], (PageView, jst) ->

  class TourView extends PageView

    template: jst

    render: ->
      super

      $('.thm a').fancybox
        overlayColor: '#000000'

      @
