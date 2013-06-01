define [
  'at-common/views/view'
  'jst!at-pp/templates/content/post'
], (View, jst) ->

  class Post extends View

    attributes:
      class: 'news-post'

    template: jst
