define [
  'quilt'
  'moment'
], (Quilt, moment) ->

  Quilt.attributes.dateFormat = (el, options) ->
    new DateFormat(el: el, model: @model, format: options)

  class DateFormat extends Quilt.View

    constructor: ({@format}) ->
      super

    render: ->
      attr = @$el.data('date-attr') or 'created_at'
      value = @model.get(attr)
      @$el.html(moment(value).format(@format))
      return this
