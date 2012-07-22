define [
  'views/page'
  'jst!templates/pages/contact'
], (Page, jst) ->

  class ContactView extends Page

    template: jst

    events:
      'submit #email_form': 'submit'

    submit: ->
      console.log $('#email_form').serialize()
      false