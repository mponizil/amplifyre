define [
  'themes/common/views/view'
  'jst!themes/common/templates/forms/subscribe'
], (View, jst) ->

  class SubscribeView extends View

    template: jst

    events:
      'submit [data-subscribe]': 'subscribe'

    render: ->
      super
      @$alert.hide()
      return this

    subscribe: (e) ->
      e.preventDefault()
      @$alert.hide()
      email = @$email.val()

      if email and email.match(/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i)
        @model.subscribe {email}, {@success}
      else
        @error()

    error: ->
      @alert("Please enter a valid email address to subscribe.")

    success: =>
      @alert("Thanks, we'll be in touch!")

    alert: (message) ->
      @$alert.html(message)
      @$alert.fadeIn('slow')
      @$email.focus()
