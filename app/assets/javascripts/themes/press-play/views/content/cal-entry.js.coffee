define [
  'quilt'
  'jst!templates/content/cal-entry'
], (Quilt, jst) ->

  class CalEntry extends Quilt.View

    template: jst

    attributes:
      class: 'cal-entry clearfix'
