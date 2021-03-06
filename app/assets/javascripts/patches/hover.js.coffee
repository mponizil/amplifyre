define [
  'quilt'
], (Quilt) ->

  # # data-hover
  #
  # Fade in `$target` when mousing over `$source`.
  Quilt.patches.hover = (el, options) ->
    $target = $(el).parent().find("[data-hover-target=#{options}]")
    new Hover {el, $target}

  class Hover extends Quilt.View

    constructor: (options={}) ->
      super

      if options.$target
        @$source = @$el
        @$target = options.$target
      else if options.$source
        @$source = options.$source
        @$target = @$el
      else
        @$source = @$target = @$el

    render: ->
      @$source.hover(
        => @fadeIn()
        => @fadeOut()
      )
      return this

    fadeIn: ->
      @$target.animate(opacity: 1)

    fadeOut: ->
      @$target.animate(opacity: 0)

    dispose: ->
      super
      @$source.off 'mouseenter mouseleave'
