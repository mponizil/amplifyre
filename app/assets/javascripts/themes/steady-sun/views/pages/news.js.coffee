define [
  'at-ss/views/pages/base/plain'
  'jst!at-ss/templates/pages/news'
], (PlainPage, jst) ->

  class NewsView extends PlainPage

    template: jst

    render: ->
      super
      $('.container:first').attr('id', 'news-page')
      return this
