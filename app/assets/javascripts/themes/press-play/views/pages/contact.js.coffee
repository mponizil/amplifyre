define [
  'views/page'
  'jst!templates/pages/contact'
], (PageView, jst) ->

  class ContactView extends PageView

    template: jst

    events:
      'submit #email_form': 'submit'

    submit: ->
      console.log $('#email_form').serialize()
      false