define [
  'themes/default/views/pages/base/bare'
  'jst!themes/default/templates/pages/contact'
], (BarePage, jst) ->

  class ContactPage extends BarePage

    template: jst

    category: 'contact'
