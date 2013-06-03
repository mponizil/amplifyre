define [
  'underscore'
  'themes/common/views/view'
], (_, View) ->

  class BarePage extends View

    constructor: (options) ->
      _.extend(@, _.pick(options, 'band_site'))
      super

    render: ->
      super
      $('.container:first').attr('id', "#{ @category }-page") if @category
      return this
