define [
  'quilt'
], (Quilt) ->

  Quilt.attributes.hover = (el, options) ->
    new Hover {el}

  class Hover extends Quilt.View

    render: ->
      super

      @$el.css(opacity: 0)

      @$el.hover(
        -> $(this).animate(opacity: 1)
        -> $(this).animate(opacity: 0)
      )

      return this
