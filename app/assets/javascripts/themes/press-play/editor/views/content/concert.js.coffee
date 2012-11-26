define [
  'ui/editable'
  'ui/destroy'
  'views/helper-view'
], (Editable, Destroy, HelperView) ->

  class ConcertView extends HelperView

    inject: ->
      @$right.append('''
        <div style='margin-top:10px' class='edit-mode'>
          <button type='button' class='delete' data-ref='destroy'>Delete Concert</button>
        </div>''')

    render: ->
      super

      @views.push(new Editable.DateInput
        el: @$date
        model: @model
        attr: 'date'
      .render())

      @views.push(new Editable.TextInput
        el: @$venue
        model: @model
        attr: 'venue'
      .render())

      @views.push(new Editable.TextArea
        el: @$details
        model: @model
        attr: 'details'
      .render())

      @views.push(new Destroy
        el: @$destroy
        model: @model
      .render())

      return this
