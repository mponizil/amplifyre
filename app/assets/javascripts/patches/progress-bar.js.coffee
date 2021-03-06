define [
  'jquery'
  'quilt'
], ($, Quilt) ->

  Quilt.patches.progressBar = (el, options) ->
    new ProgressBar(el: el, model: @model)

  class ProgressBar extends Quilt.View

    constructor: ({@$target}) ->
      super

    initialize: ->
      super

      @model.on('request', @show, @)
      @model.on('progress', @update, @)
      @model.on('sync', @hide, @)

    template: -> """
      <div class='progress-outer'>
        <div class='progress-inner' data-ref='bar'></div>
      </div>"""

    render: ->
      super
      @hide()
      return this

    show: ->
      @$target.addClass('hide')
      @$el.removeClass('hide')

    hide: ->
      @$el.addClass('hide')
      @$target.removeClass('hide')

    update: (model, pct) ->
      @$bar.animate(width: "#{ pct }%")
