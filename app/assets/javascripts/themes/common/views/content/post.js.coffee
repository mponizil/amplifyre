define [
  'at-common/views/view'
  'jst!at-common/templates/content/post'
], (View, jst) ->

  class PostView extends View

    template: jst
