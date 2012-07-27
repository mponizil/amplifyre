define [
  'ui/html'
], (Html) ->

  class TrackView extends Html

    initialize: ->
      super

      @model.on('change:active', @render, @)

    tagName: 'li'

    attributes:
      class: 'clearfix'

    attr: 'title'

    events:
      'click': 'play'

    play: ->
      @model.set(active: true)
      @model.set(playing: true)

    render: ->
      super
      @$el.toggleClass('playing-bg', @model.get('active'))
      @
