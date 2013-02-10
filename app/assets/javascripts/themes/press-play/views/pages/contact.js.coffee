define [
  'at-pp/views/pages/base/white-box'
  'jst!at-pp/templates/pages/contact'
], (WhiteBoxPage, jst) ->

  class ContactPage extends WhiteBoxPage

    template: jst

    events: ->
      _.extend super,
        'submit [data-email-form]': 'submit'

    submit: (e) ->
      console.log $(e.target).serialize()
      false
