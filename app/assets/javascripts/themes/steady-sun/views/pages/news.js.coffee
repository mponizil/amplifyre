define [
  'at-ss/views/pages/base/plain'
  'at-common/views/content/post'
  'jst!at-ss/templates/pages/news'
], (PlainPage, PostView, jst) ->

  class NewsView extends PlainPage

    template: jst

    render: ->
      super

      $('.container:first').attr('id', 'news-page')

      @views.push(new List
        el: @$posts
        view: PostView
        collection: @collection
      .render())

      return this
