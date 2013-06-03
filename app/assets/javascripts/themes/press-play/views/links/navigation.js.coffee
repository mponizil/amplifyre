define [
  'list'
  'themes/common/views/view'
  'help!themes/press-play/views/links/nav-item'
  'jst!themes/press-play/templates/links/navigation'
], (List, View, NavItem, jst) ->

  class NavigationView extends View

    constructor: ({@router}) ->
      super

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$custom_nav
        view: (NavItem.extend tagName: 'li')
        collection: @collection
      .render())

      return this
