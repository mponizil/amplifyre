define [
  'themes/press-play/views/pages/base/content-box'
  'help!themes/press-play/views/content/post'
  'jst!themes/press-play/templates/pages/news'
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
