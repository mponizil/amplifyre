define [
  'list'
  'at-common/views/view'
  'help!at-common/views/links/nav-item'
  'jst!at-common/templates/links/navigation'
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
