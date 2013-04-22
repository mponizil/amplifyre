define [
  'quilt'
], (Quilt) ->

  class HelperView extends Quilt.View

    initialize: ->
      super
      @cache()

    inject: ->
      return

    render: ->
      @inject()
      @cache()
      return this
