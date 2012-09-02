define [
  'quilt'
], (Quilt) ->

  # Set and update the current element's content based on an attribute.
  Quilt.attributes.html = (el, options) ->
    new Html
      el: el
      attr: options
      model: @model

  class Html extends Quilt.View

    initialize: (options) ->
      super
      _.extend(@, _.pick(options, 'attr'))
      @model.on('change:' + @attr, @render, @)

    render: ->
      @$el.html(@model.get(@attr))
      @

    events:
      'update': 'update'

    update: (e, value) ->
      window.derp = @model
      @model.save(@attr, value)
