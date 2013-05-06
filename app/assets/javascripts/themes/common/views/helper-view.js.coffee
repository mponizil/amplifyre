define [
  'quilt'
], (Quilt) ->

  class HelperView extends Quilt.View

    initialize: ->
      super
      @cache()

    # Before rendering this view,
    # *alter* existing dom,
    alter: -> return

    # and then
    # *inject* new dom.
    inject: -> return

    render: ->
      @alter()
      @inject()
      @cache()
      return this
