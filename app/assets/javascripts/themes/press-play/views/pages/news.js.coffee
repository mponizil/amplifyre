define [
  'views/pages/base'
  'views/content/post'
  'jst!templates/pages/news'
], (PageView, PostView, jst) ->

  class NewsView extends PageView

    template: jst

    render: ->
      super

      @views.push(new List
        el: @$news
        view: PostView
        collection: @collection
      .render())

      @
