define [
  'at-ss/views/pages/base/plain'
  'jst!at-ss/templates/pages/contact'
], (PlainPage, jst) ->

  class ContactPage extends PlainPage

    template: jst

    render: ->
      super
      $('.container:first').attr('id', 'custom-page')
      return this
