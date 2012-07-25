define [
  'quilt'
  'list'
  'views/nav-item'
], (Quilt, List, NavItem) ->

  class NavigationView extends Quilt.View

    template: -> '<ul></ul>'

    render: ->
      super

      @views.push(new List
        el: @$('ul')
        view: NavItem
        collection: @collection
      .render())

      @
