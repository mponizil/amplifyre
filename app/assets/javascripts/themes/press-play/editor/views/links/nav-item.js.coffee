define [
  'views/helper-view'
], (HelperView) ->

  class NavItemView extends HelperView

    inject: ->
      @$el.attr('data-sortable-id', @model.id)
