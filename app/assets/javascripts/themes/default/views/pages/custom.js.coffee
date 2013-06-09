define [
  'themes/default/views/pages/base/bare'
  'jst!themes/default/templates/pages/custom'
], (BarePage, jst) ->

  class CustomPage extends BarePage

    template: jst

    category: 'custom'
