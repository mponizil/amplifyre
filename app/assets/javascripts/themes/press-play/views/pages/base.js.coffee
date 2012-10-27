define [
  'quilt'
], (Quilt) ->

  class Page extends Quilt.View

    events:
      'size:update': 'resize'

    resize: (e, max_height, bottom) ->
      @$content.css('max-height', max_height)
      @$content.css('top', bottom)

      sp_height = max_height
      @$content.children().each ->
        if !$(@).hasClass('scrollpane') then sp_height -= $(@).outerHeight()

      @$scrollpane?.css('max-height', sp_height)
