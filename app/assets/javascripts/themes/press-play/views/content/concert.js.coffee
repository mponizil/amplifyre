define [
  'quilt'
  'jst!templates/content/concert'
], (Quilt, jst) ->

  class CalEntry extends Quilt.View

    attributes:
      class: 'concert'

    template: jst
