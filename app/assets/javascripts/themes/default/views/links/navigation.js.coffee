define [
  'list'
  'themes/common/views/view'
  'themes/default/views/links/nav-item'
  'jst!themes/default/templates/links/navigation'
], (List, View, NavItem, jst) ->

  class NavigationView extends View

    constructor: ({@router}) ->
      super

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$nav
        view: (NavItem.extend tagName: 'li')
        collection: @collection
      .render())

      return this
