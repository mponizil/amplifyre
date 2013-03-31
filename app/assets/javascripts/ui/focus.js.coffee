define [
  'underscore'
  'quilt'
], (_, Quilt) ->

  Quilt.attributes.focus = (el) ->
    _.defer -> $(el).focus()
