define [
  'quilt'
], ({View}) ->

  class TickerView extends View

    constructor: ->
      super
      @model.on('change:index', @swap, @)
      @model.on('change:playing', @render, @)

    template: ->
      if active = @model.active()
        "#{ active.get('title') } - #{ active.get('artist') }"
      else
        ""

    render: ->
      super
      @toggle()
      return this

    swap: ->
      @$el.fadeOut =>
        @$el.html @template()
        @$el.fadeIn()

    toggle: ->
      if @model.get('playing')
        @$el.fadeIn()
      else
        @$el.fadeOut()
