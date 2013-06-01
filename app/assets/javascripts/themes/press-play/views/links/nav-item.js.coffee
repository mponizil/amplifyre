define [
  'at-common/views/view'
  'jst!at-pp/templates/links/nav-item'
], (View, jst) ->

  class NavItem extends View

    initialize: ->
      super

      @model.on('change:title change:slug', @render, @)

    tagName: 'li'

    template: jst
