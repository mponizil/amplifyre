define [
  'quilt'
  'list'
  'views/links/nav-item'
], (Quilt, List, NavItem) ->

  class NavigationView extends Quilt.View

    constructor: ({@router}) ->
      super

    attributes:
      class: 'clearfix'

    template: -> '''
      <ul class='nav-bar-set'>
        <li><a data-fragment='home'>Home</a></li>
      </ul>
      <ul class='nav-bar-set' data-ref='custom_nav'></ul>
      <ul class='nav-bar-set' data-edit-mode>
        <li class='dropdown' data-dropdown>
          <span class='dropdown-toggle' data-dropdown-toggle>+ New</span>
          <ul class='dropdown-content' data-dropdown-content>
            <li data-new-page='news'>News</li>
            <li data-new-page='photos'>Photos</li>
            <li data-new-page='music'>Music</li>
            <li data-new-page='tour'>Tour</li>
            <li data-new-page='contact'>Contact</li>
            <li data-new-page='custom'>Custom</li>
          </ul>
        </li>
      </ul>'''

    render: ->
      super

      @views.push(new List
        el: @$custom_nav
        view: NavItem
        collection: @collection
      .render())

      return this
