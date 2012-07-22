class PressPlay.Views.BackgroundView extends Backbone.View

  el: "body"

  initialize: ->
    @divs = $("#background, #background-desat")
    @initMeasure => @render()
    $(window).resize => @render()

  render: ->
    [windowWidth, windowHeight, windowRatio] = @measureWindow()

    if windowRatio > @imgRatio
      @forcedWidth = windowWidth
      widthRatio = windowWidth / @imgWidth
      @forcedHeight = @imgHeight * widthRatio
    else
      @forcedHeight = windowHeight
      heightRatio = windowHeight / @imgHeight
      @forcedWidth = @imgWidth * heightRatio

    @divs.find("img").width(@forcedWidth).height(@forcedHeight)

    marginTop = -@forcedHeight / 2
    marginLeft = -@forcedWidth / 2
    @divs.css("margin-top", marginTop).css("margin-left", marginLeft)

  initMeasure: (next) ->
    [windowWidth, windowHeight, windowRatio] = @measureWindow()
    $("#background img").load =>
      @imgWidth = $("#background img").width()
      @imgHeight = $("#background img").height()
      @imgRatio = @imgWidth / @imgHeight
      next()

  measureWindow: ->
    windowWidth = $(window).width()
    windowHeight = $(window).height()
    [$(window).width(), $(window).height(), windowWidth / windowHeight]