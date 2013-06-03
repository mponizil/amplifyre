define [
  'themes/steady-sun/views/pages/base/plain'
  'jst!themes/steady-sun/templates/pages/custom'
], (PlainPage, jst) ->

  class CustomPage extends PlainPage

    template: jst

    render: ->
      super
      $('.container:first').attr('id', 'custom-page')
      return this
