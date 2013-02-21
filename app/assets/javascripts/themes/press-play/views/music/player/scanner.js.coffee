define [
  'quilt'
  'jst!at-pp/templates/music/player/scanner'
], (Quilt, jst) ->

  class ScannerView extends Quilt.View

    initialize: ({@player}) ->
      super

    template: jst

    events:
      'click [data-ref=prev]': -> @player.set(index: @player.prev())
      'click [data-ref=next]': -> @player.set(index: @player.next())

    render: ->
      super

      @$prev.addClass('transparent')
      @$next.addClass('transparent')

      @$('[data-ref=prev], [data-ref=next]').hover(
        -> $(this).animate(opacity: 1)
        -> $(this).animate(opacity: 0)
      )

      return this
