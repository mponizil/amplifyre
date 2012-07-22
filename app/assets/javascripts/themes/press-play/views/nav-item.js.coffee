define [
  'quilt'
  'jst!templates/nav-item'
], (Quilt, jst) ->

  class NavItem extends Quilt.View

    tagName: 'li'

    template: jst
