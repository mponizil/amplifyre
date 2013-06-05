define [
  'patches/sortable'
  'themes/common/views/helper-view'
  'themes/default/editor/views/links/page-categories'
], (Sortable, HelperView, PageCategoriesView) ->

  class EditNavigationView extends HelperView

    inject: ->
      @$el.append("<ul class='nav' data-ref='new_page'></ul>")

    render: ->
      super

      @views.push(new Sortable
        el: @$nav
        collection: @collection
        label: 'pages'
      .render())

      @views.push(new PageCategoriesView
        el: @$new_page
        collection: @collection
        router: @router
      .render())

      return this
