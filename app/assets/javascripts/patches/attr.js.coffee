define [
  'quilt'
], (Quilt) ->

  # Set and update the current element's content based on an attribute.
  Quilt.patches.attr = (el, options) ->
    new Attr
      el: el
      attr: options
      model: @model

  class Attr extends Quilt.View

    initialize: (options) ->
      super
      _.extend(@, _.pick(options, 'attr'))
      @model.on('change:' + @attr, @render, @)

    render: ->
      @$el.html(@model.get(@attr))
      return this
