define [
  'at-pp/views/pages/base'
  'jst!at-pp/templates/pages/custom'
], (PageView, jst) ->

  class CustomView extends PageView

    template: jst
