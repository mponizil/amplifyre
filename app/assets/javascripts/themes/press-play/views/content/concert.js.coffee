define [
  'views/view'
  'jst!templates/content/concert'
], (View, jst) ->

  class ConcertView extends View

    attributes:
      class: 'concert'

    template: jst
