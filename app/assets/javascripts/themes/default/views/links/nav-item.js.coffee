define [
  'themes/common/views/view'
  'jst!themes/default/templates/links/nav-item'
], (View, jst) ->

  class NavItem extends View

    initialize: ->
      super
      @model.on('change:slug change:title', @render, @)

    template: jst
