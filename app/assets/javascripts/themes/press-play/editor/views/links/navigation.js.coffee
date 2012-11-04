define [
  'editor/views/view'
], (View) ->

  class EditNavigation extends View

    constructor: ({@router}) ->
      super

    events:
      'click [data-new-page]': 'newPage'

    newPage: (e) ->
      e.stopPropagation()

      category = $(e.target).data('new-page') or 'custom'

      @collection.create { category: category }
      , wait: true
      , success: (page, resp) =>
          @router.navigate(page.get('slug'), true)
