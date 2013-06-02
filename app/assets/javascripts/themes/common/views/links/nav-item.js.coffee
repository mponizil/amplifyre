define [
  'at-common/views/view'
  'jst!at-common/templates/links/nav-item'
], (View, jst) ->

  class NavItem extends View

    initialize: ->
      super
      @model.on('change:slug change:title', @render, @)

    template: jst
