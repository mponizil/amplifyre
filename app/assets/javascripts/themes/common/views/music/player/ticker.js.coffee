define [
  'at-common/views/view'
], (View) ->

  class TickerView extends View

    constructor: ->
      super
      @model.on('change:index', @update, @)
      @model.on('change:playing', @update, @)

    template: (o) ->
      "#{o.model.active.get('title')} - #{o.model.active.get('artist')}"

    render: ->
      return this unless @model.active

      super
      @toggle()
      return this

    update: ->
      if @model.hasChanged('index')
        @swap()
      else if @model.hasChanged('playing')
        @toggle()

    swap: ->
      @$el.fadeOut =>
        @$el.html @template {@model}
        @$el.fadeIn()

    toggle: ->
      if @model.get('playing') then @$el.fadeIn()
      else @$el.fadeOut()
