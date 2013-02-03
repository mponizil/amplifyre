define [
  'quilt'
  'jst!at-pp/editor/templates/links/page-categories'
], (Quilt, jst) ->

  class PageCategories extends Quilt.View

    constructor: ({@router}) ->
      super

    initialize: ->
      super

      @collection.on('add remove', @updateCategories, @)

    template: jst

    events:
      'click [data-new-page]': 'newPage'

    render: ->
      super
      @updateCategories()
      return this

    updateCategories: ->
      @$('[data-new-page]').each (e, el) =>
        $el = $(el)
        category = $el.data().newPage
        used = @collection.find (page) -> category is page.get('category')
        $el.toggleClass('hide', !!used and category isnt 'custom')

    newPage: (e) ->
      @$('[data-dropdown]').trigger('dropdown:hide')

      category = $(e.currentTarget).data('new-page') or 'custom'

      @collection.create { category: category }
      , wait: true
      , success: (page, resp) =>
        @router.navigate(page.get('slug'), true)
