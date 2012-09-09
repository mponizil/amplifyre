define [
  'quilt'
], (Quilt) ->

  Quilt.attributes.editMode = (el, options) ->
    new EditMode(el: el)

  class EditMode extends Quilt.View

    render: ->
      super

      # TODO: This should be done somewhere else
      if window.location.pathname.indexOf('/edit/') < 0
        console.log @
        @remove().destroy()

      @
