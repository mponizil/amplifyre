define [
  'quilt'
  'list'
  'views/links/nav-item'
  'jst!templates/links/navigation'
], (Quilt, List, NavItem, jst) ->

  class NavigationView extends Quilt.View

    constructor: ({@router}) ->
      super

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$custom_nav
        view: NavItem
        collection: @collection
      .render())

      return this
