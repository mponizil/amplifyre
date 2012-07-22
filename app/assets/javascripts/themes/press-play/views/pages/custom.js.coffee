define [
  'views/page'
  'templates/pages/custom'
], (Page, jst) ->

  class CustomView extends Page

    template: jst