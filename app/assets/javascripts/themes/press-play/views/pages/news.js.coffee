define [
  'views/page'
  'jst!templates/pages/news'
], (Page, jst) ->

  class NewsView extends Page

    template: jst