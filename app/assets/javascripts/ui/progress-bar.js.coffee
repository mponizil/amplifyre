define [
  'jquery'
  'quilt'
], ($, Quilt) ->

  Quilt.attributes.progressBar = (el, options) ->
    new ProgressBar(el: el, model: @model)

  class ProgressBar extends Quilt.View

    constructor: ({@$target}) ->
      super

    initialize: ->
      super

      @model.on('request', @show, @)
      @model.on('progress', @update, @)
      @model.on('sync', @hide, @)

    template: -> '''
      <div class='progress-outer'>
        <div class='progress-inner' data-bar></div>
      </div>'''

    render: ->
      super
      @$el.html(@template)
      @$bar = @$('[data-bar]')
      @hide()
      return this

    show: ->
      @$target.addClass('hidden')
      @$el.removeClass('hidden')

    hide: ->
      @$el.addClass('hidden')
      @$target.removeClass('hidden')

    update: (model, pct) ->
      @$bar.animate(width: pct + '%')
