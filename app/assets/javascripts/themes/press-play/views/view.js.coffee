define [
  'underscore'
  'quilt'
], (_, Quilt) ->

  class View extends Quilt.View

    constructor: (options) ->
      super

      if @constructor.helpers?.editor
        _.extend @constructor.helpers.editor, options

    render: ->
      super

      if @constructor.helpers?.editor
        @views.push((new @constructor.helpers.editor(el: @$el)).render())
