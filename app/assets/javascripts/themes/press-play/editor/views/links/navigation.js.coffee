define [
  'quilt'
], (Quilt) ->

  class EditNavigation extends Quilt.View

    constructor: ({@router}) ->
      super

    events:
      'click [data-new-page]': 'newPage'

    render: ->
      return this

    newPage: (e) ->
      e.stopPropagation()

      category = $(e.target).data('new-page') or 'custom'

      @collection.create { category: category }
      , wait: true
      , success: (page, resp) =>
          @router.navigate(page.get('slug'), true)
