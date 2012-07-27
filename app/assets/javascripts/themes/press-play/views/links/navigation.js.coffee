define [
  'quilt'
  'list'
  'views/links/nav-item'
], (Quilt, List, NavItem) ->

  class NavigationView extends Quilt.View

    attributes:
      class: 'clearfix'

    template: -> '''
      <ul class='left'>
        <li><a data-fragment='home'>Home</a></li>
      </ul>
      <ul class='left' data-ref='custom_nav'></ul>'''

    render: ->
      super

      @views.push(new List
        el: @$custom_nav
        view: NavItem
        collection: @collection
      .render())

      @
