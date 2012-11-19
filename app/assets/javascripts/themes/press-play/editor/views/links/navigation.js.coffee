define [
  'ui/sortable'
  'editor/views/view'
  'editor/views/links/page-categories'
], (Sortable, View, PageCategoriesView) ->

  class EditNavigation extends View

    constructor: ({@router}) ->
      super

    render: ->
      super

      @views.push(new Sortable
        el: @$('[data-ref=custom_nav]')
        collection: @collection
      .render())

      @$new_page = $('<ul>').addClass('horizontal-list')
      @$new_page.appendTo(@$el)

      @views.push(new PageCategoriesView
        el: @$new_page
        collection: @collection
        router: @router
      .render())

      return this
