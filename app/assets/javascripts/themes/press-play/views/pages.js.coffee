define [
  'quilt'
  'help!at-pp/views/pages/news'
  'help!at-pp/views/pages/listen'
  'help!at-pp/views/pages/photos'
  'help!at-pp/views/pages/tour'
  'help!at-pp/views/pages/contact'
  'help!at-pp/views/pages/custom'
], (Quilt, NewsView, ListenView, PhotosView, TourView, ContactView, CustomView) ->

  class Pages extends Quilt.View

    constructor: ({@router, @band_site, @player}) ->
      super

    initialize: ->
      super

      @router.on('page:change', (page, model) ->
        @[page](model)
      , @)

    index: ->
      @changePage new Quilt.View

    news: (model) ->
      @changePage new NewsView
        model: model
        collection: @band_site.posts()

    listen: (model) ->
      @changePage new ListenView
        model: model
        albums: @band_site.albums()
        tracks: @band_site.tracks()
        player: @player

    photos: (model) ->
      @changePage new PhotosView
        model: model
        collection: @band_site.photos()

    tour: (model) ->
      @changePage new TourView
        model: model
        collection: @band_site.concerts()

    contact: (model) ->
      @changePage new ContactView(model: model)

    custom: (model) ->
      @changePage new CustomView(model: model)

    changePage: (view) ->
      @page?.destroy().remove()
      @$el.html((@page = view.render()).el)
      @$el.trigger('page:render')
