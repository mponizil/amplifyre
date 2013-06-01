define [
  'patches/sortable'
  'at-common/views/helper-view'
  'at-pp/editor/views/links/page-categories'
], (Sortable, HelperView, PageCategoriesView) ->

  class EditNavigation extends HelperView

    inject: ->
      @$el.append("<ul class='nav pull-right' data-ref='new_page'></ul>")

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
