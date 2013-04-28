define [
  'util/crack-rock'
  'at-pp/views/view'
  'jst!at-pp/templates/visual/background'
], (CrackRock, View, jst) ->

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
      [windowWidth, windowHeight] = @measureWindow()

      [forcedWidth, forcedHeight] = @image.resizeToFill(windowWidth, windowHeight)

      @$bgs.children('img').width(forcedWidth).height(forcedHeight)

      marginTop = -forcedHeight / 2
      marginLeft = -forcedWidth / 2
      @$bgs.css('margin-top': marginTop, 'margin-left': marginLeft)

    initMeasure: (next) ->
      [windowWidth, windowHeight] = @measureWindow()
      @$bg_active.children('img').load (e) =>
        @image = new CrackRock(width: e.target.width, height: e.target.height)
        next()

    measureWindow: ->
      $window = $(window)
      [$window.width(), $window.height()]
