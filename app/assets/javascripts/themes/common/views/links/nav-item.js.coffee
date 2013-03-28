define [
  'themes/common/views/view'
  'jst!themes/common/templates/links/nav-item'
], (View, jst) ->

  class NavItem extends View

    tagName: 'li'

    template: jst
