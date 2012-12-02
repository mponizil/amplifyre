define [
  'at-pp/views/pages/base'
  'jst!at-pp/templates/pages/contact'
], (PageView, jst) ->

  class ContactView extends PageView

    template: jst

    events: ->
      _.extend super,
        'submit [data-email-form]': 'submit'

    submit: (e) ->
      console.log $(e.target).serialize()
      false
