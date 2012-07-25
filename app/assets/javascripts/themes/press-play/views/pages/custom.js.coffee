define [
  'views/page'
  'jst!templates/pages/custom'
], (Page, jst) ->

  class CustomView extends Page

    template: jst
