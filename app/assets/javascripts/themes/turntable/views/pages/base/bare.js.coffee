define [
  'underscore'
  'jquery'
  'themes/common/views/view'
], (_, $, View) ->

  class BarePage extends View

    constructor: (options) ->
      _.extend(@, _.pick(options, 'band_site'))
      super

    render: ->
      super
      $('[data-ref=container]').attr('id', "page-#{ @category }") if @category
      return this
