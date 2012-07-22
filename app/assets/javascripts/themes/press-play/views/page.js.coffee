define [
  'quilt'
], (Quilt) ->

  class Page extends Quilt.View

    initialize: ->
      $(window).resize => @updateContentHeight()

    render: ->
      @$el.html(@template(@model.toJSON())).show()
      @updateContentHeight()

    destroy: (next) ->
      @$el.fadeOut('fast'
        => next?()
      )
      super

    updateContentHeight: =>
      top = $('.black-banner').offset().top - 60
      bottom = $('nav').offset().top + $('nav').height() + 20
      max_height = top - bottom

      $('.content').css('max-height', max_height)
      $('.content').css('top', bottom)

      sp_height = max_height
      $('.content').children().each ->
        if !$(@).hasClass('scrollpane') then sp_height -= $(@).outerHeight()

      $('.scrollpane').css('max-height', sp_height)