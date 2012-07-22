define [
  'quilt'
  'jst!templates/background'
], (Quilt, jst) ->

  class BackgroundView extends Quilt.View

    template: jst

    render: ->
      super

      @divs = @$('#background-sat, #background-desat')

      @initMeasure => @resize()
      $(window).resize => @resize()

      @

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

      @divs.children('img').width(@forcedWidth).height(@forcedHeight)

      marginTop = -@forcedHeight / 2
      marginLeft = -@forcedWidth / 2
      @divs.css('margin-top', marginTop).css('margin-left', marginLeft)

    initMeasure: (next) ->
      [windowWidth, windowHeight, windowRatio] = @measureWindow()
      $('#background-sat img').load =>
        @imgWidth = $('#background-sat img').width()
        @imgHeight = $('#background-sat img').height()
        @imgRatio = @imgWidth / @imgHeight
        next()

    measureWindow: ->
      windowWidth = $(window).width()
      windowHeight = $(window).height()
      [$(window).width(), $(window).height(), windowWidth / windowHeight]