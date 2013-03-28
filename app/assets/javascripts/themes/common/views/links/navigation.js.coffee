define [
  'list'
  'themes/common/views/view'
  'help!themes/common/views/links/nav-item'
  'jst!themes/common/templates/links/navigation'
], (List, View, NavItem, jst) ->

  class NavigationView extends View

    constructor: ({@router}) ->
      super

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$nav
        view: NavItem
        collection: @collection
      .render())

      return this
