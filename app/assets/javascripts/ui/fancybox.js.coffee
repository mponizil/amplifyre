define [
  'fancybox'
  'underscore'
  'quilt'
], ($, _, Quilt) ->

  settings = helpers: overlay: css: 'background-color': 'rgba(0, 0, 0, 0.4)'

  presets =
    default: settings
    video: _.extend {}, settings, type: 'iframe'

  Quilt.attributes.fancybox = (el, options) ->
    options or= 'default'
    settings = presets[options] or presets.default
    new Fancybox({ el, settings })

  class Fancybox extends Quilt.View

    constructor: ({@settings}) ->
      super

    render: ->
      @$('[data-fancybox-group]').fancybox(@settings)
      return this
