define [
  'editor/views/view'
  'editor/views/pages/news'
  'editor/views/pages/listen'
  'editor/views/pages/photos'
  'editor/views/pages/tour'
  'editor/views/pages/contact'
  'editor/views/pages/custom'
], (View, EditNewsView, EditListenView, EditPhotosView, EditTourView, EditContactView, EditCustomView) ->

  class EditPages extends View

    constructor: ({@router, @band_site, @player}) ->
      super

    initialize: ->
      super

      @router.on('page:change', (page, model) ->
        @[page](model)
      , @)
      @band_site.pages().on('destroy', ->
        @router.navigate('home', true)
      , @)

    index: ->
      @changePage new View
        el: @$el

    news: (model) ->
      @changePage new EditNewsView
        el: @$el
        model: model
        collection: @band_site.posts()

    listen: (model) ->
      @changePage new EditListenView
        el: @$el
        model: model
        collection: @band_site.tracks()
        albums: @band_site.albums()
        player: @player

    photos: (model) ->
      @changePage new EditPhotosView
        el: @$el
        model: model
        collection: @band_site.photos()

    tour: (model) ->
      @changePage new EditTourView
        el: @$el
        model: model
        collection: @band_site.concerts()

    contact: (model) ->
      @changePage new EditContactView(el: @$el, model: model)

    custom: (model) ->
      @changePage new EditCustomView(el: @$el, model: model)

    changePage: (view) ->
      @page?.destroy()
      @page = view.render()
