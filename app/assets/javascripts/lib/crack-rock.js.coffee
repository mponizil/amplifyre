define [
  'underscore'
], (_) ->

  # Adapted from ...
  # http://carrierwave.rubyforge.org/rdoc/classes/CarrierWave/RMagick.html

  class CrackRock

    constructor: ({@url, @width, @height}) ->
      @id = _.uniqueId()
      @ratio = @width / @height

    resizeToScale: (scale) ->
      width = scale * @width
      height = scale * @height
      return [width, height]

    # Resize the image to fit within the specified dimensions while retaining the aspect
    # ratio of the original image. If necessary, crop the image in the larger dimension
    resizeToFill: (width, height) ->
      targetRatio = width / height

      if targetRatio > @ratio
        forcedWidth = width
        scale = width / @width
        forcedHeight = @height * scale
      else
        forcedHeight = height
        scale = height / @height
        forcedWidth = @width * scale

      return [forcedWidth, forcedHeight, scale]

    # Resize the image to fit within the specified dimensions while retaining the original
    # aspect ratio. The image may be shorter or narrower than specified in the smaller
    # dimension but will not be larger than the specified values
    resizeToFit: (width, height) ->
      targetRatio = width / height

      if targetRatio < @ratio
        forcedWidth = width
        scale = width / @width
        forcedHeight = @height * scale
      else
        forcedHeight = height
        scale = height / @height
        forcedWidth = @width * scale

      return [forcedWidth, forcedHeight, scale]
