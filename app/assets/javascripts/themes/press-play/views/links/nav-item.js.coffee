define [
  'themes/common/views/view'
  'jst!themes/press-play/templates/links/nav-item'
], (View, jst) ->

  class NavItem extends View

    initialize: ->
      super

      @model.on('change:title change:slug', @render, @)

    tagName: 'li'

    template: jst
