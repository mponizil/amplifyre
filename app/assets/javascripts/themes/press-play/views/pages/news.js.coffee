define [
  'at-pp/views/pages/base'
  'at-pp/views/content/post'
  'jst!at-pp/templates/pages/news'
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

      return this
