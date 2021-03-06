define [
  'quilt'
], (Quilt) ->

  # Destroy a model on click.
  Quilt.patches.destroy = (el, options) ->
    new Destroy(el: el, model: @model)

  class Destroy extends Quilt.View

    events:
      'click': 'click'

    confirm: (next) ->
      next() if confirm("Are you sure you want to delete this #{@model.label}?")

    click: (e) ->
      e.stopPropagation()
      @confirm => @model.destroy(wait: true)

    render: ->
      return this
