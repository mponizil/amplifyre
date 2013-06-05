define [
  'themes/common/views/view'
], (View) ->

  class PagesView extends View

    constructor: ({@router, @band_site, @player}) ->
      super

    initialize: ->
      super

      @router.on('page:change', (page, model) ->
        @[page]?(model)
      , @)

    changePage: (view) ->
      @page?.dispose().remove()
      @$el.html((@page = view.render()).el)
      @$el.trigger('page:render')
