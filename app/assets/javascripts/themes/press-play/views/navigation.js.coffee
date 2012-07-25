define [
  'quilt'
  'list'
  'views/nav-item'
], (Quilt, List, NavItem) ->

  class NavigationView extends Quilt.View

    template: -> '<ul></ul>'

    events:
      'click li' : 'navigate'

    render: ->
      super

      @views.push(new List
        el: @$('ul')
        view: NavItem
        collection: @collection
      .render())

      @

    navigate: (e) ->
      pageId = $(e.currentTarget).data('id')
      page = @collection.get(pageId)
      if page isnt window.router.m.page
        window.router.navigate(page.get('slug'), trigger: true)