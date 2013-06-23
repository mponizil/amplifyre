define [
  'themes/common/views/view'
  'jst!themes/default/templates/content/concert'
], (View, jst) ->

  class ConcertView extends View

    template: jst
