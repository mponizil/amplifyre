define [
  'underscore'
  'quilt'
], (_, Quilt) ->

  Quilt.patches.focus = (el) ->
    _.defer -> $(el).focus()
