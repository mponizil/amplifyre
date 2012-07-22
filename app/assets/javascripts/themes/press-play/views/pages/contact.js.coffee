PressPlay.Views.Pages ||= {}

class PressPlay.Views.Pages.ContactPageView extends PressPlay.Views.Page

  template: JST["themes/press-play/templates/contact"]

  events:
    "submit #email_form": "submit"

  submit: ->
    console.log $("#email_form").serialize()
    false