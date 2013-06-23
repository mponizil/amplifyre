define [
  'patches/editable'
  'patches/destroy'
  'themes/common/views/helper-view'
], (Editable, Destroy, HelperView) ->

  class ConcertView extends HelperView

    inject: ->
      @$right.append("<button type='button' class='btn btn-danger' data-ref='destroy'>Delete Concert</button>")

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
