define [
  'themes/common/views/view'
  'jst!themes/default/templates/content/post'
], (View, jst) ->

  class PostView extends View

    template: jst
