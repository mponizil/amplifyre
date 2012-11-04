define [
  'editor/views/view'
  'editor/views/links/page-categories'
], (View, PageCategoriesView) ->

  class EditNavigation extends View

    constructor: ({@router}) ->
      super

    render: ->
      super

      @$page_categories = $('<ul>').addClass('horizontal-list')
      @$page_categories.appendTo(@$el)

      @views.push(new PageCategoriesView
        el: @$page_categories
        collection: @collection
        router: @router
      .render())

      return this
