define [
  'views/view'
], (View) ->

  class Page extends View

    attributes:
      'class': 'white-box page-container'

    events: ->
      'size:update': 'resize'

    resize: (e, max_height, bottom) ->
      @$el.css('max-height', max_height)
      @$el.css('top', bottom)

      sp_height = max_height
      @$el.children().each ->
        $child = $(this)
        if $child.data('ref') isnt 'scrollpane'
          sp_height -= $child.outerHeight()

      @$scrollpane?.css('max-height', sp_height)
