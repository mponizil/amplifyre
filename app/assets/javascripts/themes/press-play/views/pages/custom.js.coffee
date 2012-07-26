define [
  'views/page'
  'jst!templates/pages/custom'
], (PageView, jst) ->

  class CustomView extends PageView

    template: jst
