define [
  'quilt'
], (Quilt) ->

  Quilt.attributes.editMode = (el, options) ->
    if window.location.pathname.indexOf('/edit') < 0
      $(el).remove()
