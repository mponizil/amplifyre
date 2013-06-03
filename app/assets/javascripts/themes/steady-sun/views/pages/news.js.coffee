define [
  'themes/steady-sun/views/pages/base/bare'
  'themes/common/views/content/post'
  'jst!themes/steady-sun/templates/pages/news'
], (BarePage, PostView, jst) ->

  class NewsView extends BarePage

    template: jst

    category: 'news'

    render: ->
      super

      @views.push(new List
        el: @$posts
        view: PostView
        collection: @collection
      .render())

      return this
