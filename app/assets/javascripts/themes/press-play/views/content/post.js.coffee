define [
  'themes/common/views/view'
  'jst!themes/press-play/templates/content/post'
], (View, jst) ->

  class Post extends View

    attributes:
      class: 'news-post'

    template: jst
