define [
  'at-ss/views/pages/base/plain'
  'themes/common/views/forms/subscribe'
  'jst!at-ss/templates/pages/contact'
], (PlainPage, SubscribeView, jst) ->

  class ContactPage extends PlainPage

    template: jst

    render: ->
      super

      $('.container:first').attr('id', 'contact-page')

      return this
