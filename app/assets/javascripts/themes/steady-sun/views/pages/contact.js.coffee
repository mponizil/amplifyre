define [
  'themes/steady-sun/views/pages/base/plain'
  'jst!themes/steady-sun/templates/pages/contact'
], (PlainPage, jst) ->

  class ContactPage extends PlainPage

    template: jst

    render: ->
      super

      $('.container:first').attr('id', 'contact-page')

      return this
