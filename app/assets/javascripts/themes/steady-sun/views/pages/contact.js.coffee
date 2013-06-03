define [
  'themes/steady-sun/views/pages/base/bare'
  'jst!themes/steady-sun/templates/pages/contact'
], (BarePage, jst) ->

  class ContactPage extends BarePage

    template: jst

    category: 'context'
