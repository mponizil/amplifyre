define [
  'quilt'
], (Quilt) ->

  class View extends Quilt.View

    render: ->
      @cache()
      return this
