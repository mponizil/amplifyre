define [
  'themes/common/views/view'
  'jst!themes/press-play/templates/content/concert'
], (View, jst) ->

  class ConcertView extends View

    className: 'media'

    tagName: 'li'

    template: jst
