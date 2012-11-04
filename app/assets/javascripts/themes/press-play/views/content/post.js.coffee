define [
  'quilt'
  'jst!templates/content/post'
], (Quilt, jst) ->

  class Post extends Quilt.View

    attributes:
      class: 'news-post'

    template: jst
