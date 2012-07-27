define [
  'quilt'
  'jst!templates/content/post'
], (Quilt, jst) ->

  class Post extends Quilt.View

    template: jst

    attributes:
      class: 'news-post'
