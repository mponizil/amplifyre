define [
  'ui/html'
], (Html) ->

  class TrackView extends Html

    initialize: ->
      super

      @model.on('play', @highlight, @)
      @model.on('stop', @clear, @)

    tagName: 'li'

    attributes:
      class: 'clearfix'

    attr: 'title'

    events:
      'click': 'play'

    play: ->
      @model.trigger('set', @model)
      @model.trigger('play', @model)

    highlight: ->
      @$el.addClass('playing-bg')

    clear: ->
      @$el.removeClass('playing-bg')
