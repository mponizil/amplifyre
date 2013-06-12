define [
  'themes/default/views/pages/base/bare'
  'help!themes/default/views/content/post'
  'jst!themes/default/templates/pages/news'
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
