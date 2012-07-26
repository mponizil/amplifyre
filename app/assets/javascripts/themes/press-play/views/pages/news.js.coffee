define [
  'views/page'
  'jst!templates/pages/news'
], (PageView, jst) ->

  class NewsView extends PageView

    template: jst
