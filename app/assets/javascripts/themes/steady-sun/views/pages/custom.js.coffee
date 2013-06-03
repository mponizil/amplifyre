define [
  'themes/steady-sun/views/pages/base/bare'
  'jst!themes/steady-sun/templates/pages/custom'
], (BarePage, jst) ->

  class CustomPage extends BarePage

    template: jst

    category: 'custom'
