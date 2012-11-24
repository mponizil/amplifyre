define [
  'views/view'
  'jst!templates/content/post'
], (View, jst) ->

  class Post extends View

    attributes:
      class: 'news-post'

    template: jst
