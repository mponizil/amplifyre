define [
  'quilt'
  'jst!themes/default/templates/music/player/scanner'
], ({View}, jst) ->

  class ScannerView extends View

    template: jst

    events:
      'click [data-ref=prev]': -> @model.set(index: @model.prev())
      'click [data-ref=next]': -> @model.set(index: @model.next())

    render: ->
      super

      @$prev.addClass('transparent')
      @$next.addClass('transparent')

      @$('[data-ref=prev], [data-ref=next]').hover(
        -> $(this).animate(opacity: 1)
        -> $(this).animate(opacity: 0)
      )

      return this
