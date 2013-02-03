define [
  'at-pp/views/view'
  'jst!at-pp/templates/visual/background'
], (View, jst) ->

  class BackgroundView extends View

    template: jst

    initialize: ({@player}) ->
      super

      @player.on('change:playing', @update, @)
      @model.on('change:background_file', @render, @)

    render: ->
      $(window).off('resize', @resize)

      super

      @$bgs = @$('[data-ref^=bg_]')

      @$bg_active.addClass('hide') unless @player.get('playing')

      @initMeasure => @resize()
      $(window).on('resize', @resize)

      return this

    update: (player, playing) ->
      if playing then @fadeUp()
      else @fadeDown()

    fadeUp: ->
      @$bg_active.fadeIn(1000, 'easeOutSine')

    fadeDown: ->
      @$bg_active.fadeOut(1000, 'easeOutSine')

    resize: =>
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
      @$bgs.css('margin-top': marginTop, 'margin-left': marginLeft)

    initMeasure: (next) ->
      [windowWidth, windowHeight, windowRatio] = @measureWindow()
      @$bg_active.children('img').load (e) =>
        @imgWidth = e.target.width
        @imgHeight = e.target.height
        @imgRatio = @imgWidth / @imgHeight
        next()

    measureWindow: ->
      $window = $(window)
      windowWidth = $window.width()
      windowHeight = $window.height()
      [$window.width(), $window.height(), windowWidth / windowHeight]
