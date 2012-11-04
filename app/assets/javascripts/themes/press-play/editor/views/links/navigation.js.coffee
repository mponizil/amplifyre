define [
  'editor/views/view'
  'editor/views/links/page-categories'
], (View, PageCategoriesView) ->

  class EditNavigation extends View

    constructor: ({@router}) ->
      super

    render: ->
      super

      @$new_page = $('<ul>').addClass('horizontal-list')
      @$new_page.appendTo(@$el)

      @views.push(new PageCategoriesView
        el: @$new_page
        collection: @collection
        router: @router
      .render())

      return this
