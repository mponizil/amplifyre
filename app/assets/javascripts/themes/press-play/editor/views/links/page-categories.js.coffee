define [
  'quilt'
  'jst!editor/templates/links/page-categories'
], (Quilt, jst) ->

  class PageCategories extends Quilt.View

    constructor: ({@router}) ->
      super

    template: jst

    events: 
      'click [data-new-page]': 'newPage'

    newPage: (e) ->
      e.stopPropagation()

      category = $(e.target).data('new-page') or 'custom'

      @collection.create { category: category }
      , wait: true
      , success: (page, resp) =>
        @router.navigate(page.get('slug'), true)
