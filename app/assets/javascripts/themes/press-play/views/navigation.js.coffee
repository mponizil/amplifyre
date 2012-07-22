define [
  'quilt'
  'templates/navigation'
], (Quilt, jst) ->

  class NavigationView extends Quilt.View

    template: jst

    events:
      'click li' : 'navigate'

    render: ->
      @$el.html(@template(pages: @collection.toJSON()))

    navigate: (e) ->
      pageId = $(e.currentTarget).data('id')
      page = @collection.get(pageId)
      if page isnt window.router.m.page
        window.router.navigate(page.get('slug'), trigger: true)