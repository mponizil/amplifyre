define [
  'at-ss/views/pages/base/plain'
  'jst!at-ss/templates/pages/tour'
], (PlainPage, jst) ->

  class TourPage extends PlainPage

    template: jst

    render: ->
      super
      $('.container:first').attr('id', 'tour-page')
      return this
