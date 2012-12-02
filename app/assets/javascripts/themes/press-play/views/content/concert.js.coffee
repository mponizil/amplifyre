define [
  'at-pp/views/view'
  'jst!at-pp/templates/content/concert'
], (View, jst) ->

  class ConcertView extends View

    attributes:
      class: 'concert'

    template: jst
