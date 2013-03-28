define [
  'at-ss/views/view'
  'jst!at-ss/templates/content/concert'
], (View, jst) ->

  class ConcertView extends View

    template: jst
