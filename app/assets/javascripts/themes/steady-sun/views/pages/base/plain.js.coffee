define [
  'at-pp/views/view'
], (View) ->

  class PlainPage extends View

    constructor: (options) ->
      _.extend(@, _.pick(options, 'band_site'))
      super
