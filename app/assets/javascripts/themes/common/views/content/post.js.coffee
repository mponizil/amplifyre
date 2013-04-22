define [
  'themes/common/views/view'
  'jst!themes/common/templates/content/post'
], (View, jst) ->

  class PostView extends View

    template: jst
