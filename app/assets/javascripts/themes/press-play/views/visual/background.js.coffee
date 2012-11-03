define [
  'quilt'
  'jst!templates/visual/background'
], (Quilt, jst) ->

  class BackgroundView extends Quilt.View

    template: jst

    initialize: ({@player}) ->
      super

      @player.on('change:playing', @update, @)

    render: ->
      super

      @$bgs = @$('[data-ref^=bg_]')

      @initMeasure => @resize()
      $(window).resize => @resize()

      @

    update: (player, playing) ->
      if playing then @fadeUp()
      else @fadeDown()

    fadeUp: ->
      @$el.animate
        'background-color': '#ffffff'
      , 1000, 'easeOutSine'
      @$bg_inactive.fadeOut(1000, 'easeOutSine')

    fadeDown: ->
      @$el.animate(
        'background-color': '#ffffff'
      , 1000, 'easeOutSine')
      @$bg_active.fadeIn(1000, 'easeOutSine')

    resize: ->
      [windowWidth, windowHeight, windowRatio] = @measureWindow()

      if windowRatio > @imgRatio
        @forcedWidth = windowWidth
        widthRatio = windowWidth / @imgWidth
        @forcedHeight = @imgHeight * widthRatio
      else
        @forcedHeight = windowHeight
        heightRatio = windowHeight / @imgHeight
        @forcedWidth = @imgWidth * heightRatio

      @$bgs.children('img').width(@forcedWidth).height(@forcedHeight)

      marginTop = -@forcedHeight / 2
      marginLeft = -@forcedWidth / 2
      @$bgs.css('margin-top', marginTop).css('margin-left', marginLeft)

    initMeasure: (next) ->
      [windowWidth, windowHeight, windowRatio] = @measureWindow()
      $img = @$bg_active.children('img')
      $img.load =>
        @imgWidth = $img.width()
        @imgHeight = $img.height()
        @imgRatio = @imgWidth / @imgHeight
        next()

    measureWindow: ->
      $window = $(window)
      windowWidth = $window.width()
      windowHeight = $window.height()
      [$window.width(), $window.height(), windowWidth / windowHeight]
