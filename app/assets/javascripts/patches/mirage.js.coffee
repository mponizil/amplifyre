define [
  'jquery'
  'quilt'
  'lib/crack-rock'
], ($, Quilt, CrackRock) ->

  maxWidth = 800
  maxHeight = 450

  class Mirage extends Quilt.View

    constructor: ({@maxDimensions, @layers}) ->
      super

      # Dimensions for the maxDimensions we're constrained to
      @maxDimensions = new CrackRock(@maxDimensions)

      # Make a CrackRock version of this image for easy manip
      layer.crackRock = new CrackRock(layer) for layer in @layers

      $(window).on("resize.delegateEvents#{@cid}", _.debounce (=> @render()), 200)
      $(window).on("mousemove.delegateEvents#{@cid}", @align)

    render: ->
      super

      # Empty to remove previous layers.
      @$el.empty()

      @measure()

      # Defer so we can use $parent's dimensions.
      _.defer => @fit()

      return this

    measure: => @windowWidth = $(window).width()

    fit: ->
      # Use width for both dimensions because parent doesn't always have a height.
      @$parent = @$el.parent()
      [@width, @height, @scale] = @maxDimensions.resizeToFit(@$parent.width(), @$parent.width())

      @$el.addClass('mirage')
      # So we can use `overflow: hidden`
      @$el.css({ @width, @height })

      for image in @layers
        top = @scale * image.top
        # Scale the layers 20% larger than they need to be
        largerScale = @scale + @scale * 0.2
        [width, height] = image.crackRock.resizeToScale(largerScale)
        marginLeft = - (width - @width) / 2
        @$el.append "
          <div class='mirage-layer' style='top: #{ top }px;' data-mirage-layer='#{ image.crackRock.id }'>
            <img src='#{ image.url }' style='width: #{ width }px;
                                             height: #{ height }px;
                                             margin-left: #{ marginLeft }px' />
          </div>"

    align: (e) =>
      x = e.pageX
      offsetPct = 2 * (0.5 - x / @windowWidth)

      # Move horizontally at most 2% of total width
      maxShift = 2

      _.each @layers, (layer, i) =>
        return if layer.skip
        $layer = $("[data-mirage-layer=#{ layer.crackRock.id }]")
        depth = 2 * (0.5 - i / (@layers.length - 1))
        marginLeft = maxShift * depth * offsetPct
        $layer.css('margin-left', "#{ marginLeft }%")

    dispose: ->
      $(window).off("resize.delegateEvents#{@cid}")
      $(window).off("mousemove.delegateEvents#{@cid}")
      super
