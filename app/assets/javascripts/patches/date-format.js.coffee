define [
  'quilt'
  'moment'
  'patches/attr'
], (Quilt, moment, Attr) ->

  Quilt.patches.dateFormat = (el, options) ->
    attr = $(el).data().dateAttr or 'created_at'
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
      formatted = moment(value).format(@format)
      @$el.html(formatted)
      return this
