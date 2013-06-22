define [
  'themes/common/views/app'
  'help!themes/press-play/views/visual/background'
  'help!themes/press-play/views/music/player/ticker'
  'themes/press-play/views/links/social'
  'jst!themes/press-play/templates/app'
], (AppView, BackgroundView, TickerView, SocialView, jst) ->

  class PressPlayAppView extends AppView

    template: jst

    events:
      'route a': 'navigate'
      'page:render': 'resize'

    playbackView: -> return

    backgroundView: ->
      @views.push(new BackgroundView
        el: @$background
        model: @model
        player: @player
      .render())

    tickerView: ->
      @views.push(new TickerView
        el: @$ticker
        model: @model
        player: @player
      .render())

    socialsView: ->
      @views.push(new SocialView
        el: @$social
        collection: @model.socials()
      .render())

    render: ->
      super

      @backgroundView()
      @socialsView()

      $(window).resize => @resize()

      return this

    togglePlayer: -> return

    resize: ->
      top = @$ticker.offset().top - 60
      bottom = @$top_bar.offset().top + @$top_bar.height() + 20
      max_height = top - bottom

      @$page.children(':first').trigger('size:update', [max_height, bottom])
