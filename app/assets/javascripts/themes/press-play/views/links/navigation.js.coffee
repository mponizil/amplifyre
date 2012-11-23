define [
  'list'
  'views/view'
  'views/links/nav-item'
  'jst!templates/links/navigation'
], (List, View, NavItem, jst) ->

  class NavigationView extends View

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
