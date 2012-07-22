PressPlay.Views.Pages ||= {}

class PressPlay.Views.Page extends Backbone.View

  el: "#page"

  initialize: ->
    $(window).resize => @updateContentHeight()

  render: ->
    @$el.html(@template(@model.toJSON())).show()
    @updateContentHeight()

  destroy: (next) ->
    @$el.fadeOut('fast'
      => next?()
    )

  updateContentHeight: =>
    top = $(".black-banner").offset().top - 60
    bottom = $("nav").offset().top + $("nav").height() + 20
    max_height = top - bottom

    $(".content").css("max-height", max_height)
    $(".content").css("top", bottom)

    sp_height = max_height
    $(".content").children().each ->
      if !$(@).hasClass("scrollpane") then sp_height -= $(@).outerHeight()

    $(".scrollpane").css("max-height", sp_height)