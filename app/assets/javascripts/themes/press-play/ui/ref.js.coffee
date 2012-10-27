define [
  'quilt'
], (Quilt) ->

  # Create a reference to an element for later (cached) use.
  Quilt.attributes.ref = (el, options) ->
    @['$' + options] = $(el)
