define [
  'quilt'
], (Quilt) ->

  class HelperView extends Quilt.View

    render: ->
      @cache()
      return this
