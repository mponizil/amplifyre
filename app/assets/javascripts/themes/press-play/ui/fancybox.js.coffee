define [
  'fancybox'
  'quilt'
], ($, Quilt) ->

  Quilt.attributes.fancybox = (el, options) ->
    new Fancybox(el: el)

  class Fancybox extends Quilt.View

    render: ->
      @$('[data-fancybox-group]').fancybox
        helpers:
          overlay:
            css:
              'background-color': 'rgba(0, 0, 0, 0.4)'

      return this
