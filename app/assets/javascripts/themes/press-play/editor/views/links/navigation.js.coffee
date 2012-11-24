define [
  'ui/sortable'
  'views/helper-view'
  'editor/views/links/page-categories'
], (Sortable, HelperView, PageCategoriesView) ->

  class EditNavigation extends HelperView

    inject: ->
      @$el.append(@$new_page = $('<ul>').addClass('horizontal-list'))

    render: ->
      super

      @views.push(new Sortable
        el: @$custom_nav
        collection: @collection
        label: 'pages'
      .render())

      @views.push(new PageCategoriesView
        el: @$new_page
        collection: @collection
        router: @router
      .render())

      return this
