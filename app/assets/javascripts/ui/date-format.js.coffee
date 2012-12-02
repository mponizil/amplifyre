define [
  'quilt'
  'moment'
  'ui/attr'
], (Quilt, moment, Attr) ->

  Quilt.attributes.dateFormat = (el, options) ->
    attr = @$el.data().attr or 'created_at'
    new DateFormat
      el: el
      model: @model
      attr: attr
      format: options

  class DateFormat extends Attr

    constructor: ({@attr, @format}) ->
      super

    render: ->
      value = @model.get(@attr)
      @$el.html(moment(value).format(@format))
      return this
