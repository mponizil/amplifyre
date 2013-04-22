define [
  'underscore'
  'at-ss/views/view'
], (_, View) ->

  class PlainPage extends View

    constructor: (options) ->
      _.extend(@, _.pick(options, 'band_site'))
      super
