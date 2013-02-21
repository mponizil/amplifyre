define [
  'at-pp/views/pages/base/content-box'
  'jst!at-pp/templates/pages/contact'
], (ContentBoxPage, jst) ->

  class ContactPage extends ContentBoxPage

    template: jst

    events: ->
      _.extend super,
        'submit [data-email-form]': 'submit'

    submit: (e) ->
      console.log $(e.target).serialize()
      false
