define [
  'quilt'
], (Quilt) ->

  class HelperView extends Quilt.View

    render: ->
      @cache()

      @inject?()

      return this
