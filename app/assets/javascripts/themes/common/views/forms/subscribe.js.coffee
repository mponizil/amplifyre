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
      @$confirm.hide()
      return this

    subscribe: (e) ->
      e.preventDefault()
      @$confirm.hide()
      email = @$email.val()
      @model.subscribe {email}, {@complete}

    complete: =>
      @$confirm.html("Thanks, we'll be in touch!")
      @$confirm.fadeIn('slow')
      @$email.val('').focus()
