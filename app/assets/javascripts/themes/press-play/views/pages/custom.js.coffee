define [
  'at-pp/views/pages/base/white-box'
  'jst!at-pp/templates/pages/custom'
], (WhiteBoxPage, jst) ->

  class CustomPage extends WhiteBoxPage

    template: jst
