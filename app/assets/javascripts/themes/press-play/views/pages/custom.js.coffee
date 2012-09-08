define [
  'views/pages/base'
  'jst!templates/pages/custom'
], (PageView, jst) ->

  class CustomView extends PageView

    template: jst
