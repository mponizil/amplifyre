define [
  'quilt'
], (Quilt) ->

  class HelperView extends Quilt.View

    initialize: ->
      super

      @cache()

    render: ->
      @inject?()

      @cache()

      return this
