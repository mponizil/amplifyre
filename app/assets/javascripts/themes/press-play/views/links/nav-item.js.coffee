define [
  'quilt'
  'jst!templates/links/nav-item'
], (Quilt, jst) ->

  class NavItem extends Quilt.View

    initialize: ->
      super

      @model.on('change', @render, @)

    tagName: 'li'

    attributes: ->
      'data-sortable-id': @model.get('id')

    template: jst
