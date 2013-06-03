define [
  'themes/steady-sun/views/pages/base/plain'
  'themes/common/views/content/post'
  'jst!themes/steady-sun/templates/pages/news'
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
