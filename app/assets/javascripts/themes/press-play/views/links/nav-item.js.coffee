define [
  'quilt'
  'jst!templates/links/nav-item'
], (Quilt, jst) ->

  class NavItem extends Quilt.View

    tagName: 'li'

    template: jst
