define [
  'at-pp/views/view'
  'jst!at-pp/templates/content/concert'
], (View, jst) ->

  class ConcertView extends View

    className: 'media'

    tagName: 'li'

    template: jst
