define [
  'jquery'
  'quilt'
  'lib/crack-rock'
], ($, Quilt, CrackRock) ->

  maxWidth = 800
  maxHeight = 450

  class Mirage extends Quilt.View

    constructor: ({@container, @layers}) ->
      super

      # Dimensions for the container we're constrained to
      @container = new CrackRock(@container)
      [@width, @height, @scale] = @container.resizeToFit(maxWidth, maxHeight)

      # Make a CrackRock version of this image for easy manip
      layer.crackRock = new CrackRock(layer) for layer in @layers

    render: ->
      super

      measureWindow = => @windowWidth = $(window).width()
      measureWindow(); $(window).on('resize', measureWindow)
      $(window).on('mousemove', @align)

      @$el.addClass('mirage')
      # So we can use `overflow: hidden`
      @$el.css(height: @height)

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

      return this

    align: (e) =>
      x = e.pageX
      offsetPct = 2 * (0.5 - x / @windowWidth)

      # Move horizontally at most 2% of total width
      maxShift = 2

      _.each @layers, (layer, i) =>
        $layer = $("[data-mirage-layer=#{ layer.crackRock.id }]")
        depth = 2 * (0.5 - i / (@layers.length - 1))
        marginLeft = maxShift * depth * offsetPct
        $layer.css('margin-left', marginLeft + '%')
