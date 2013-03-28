define [
  'at-ss/views/pages/base/plain'
  'jst!at-ss/templates/pages/custom'
], (PlainPage, jst) ->

  class CustomPage extends PlainPage

    template: jst

    render: ->
      super
      $('.container:first').attr('id', 'custom-page')
      return this
