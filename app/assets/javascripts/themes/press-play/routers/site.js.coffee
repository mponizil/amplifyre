define [
  'backbone'
  'quilt'
  'views/pages/news'
  'views/pages/listen'
  'views/pages/photos'
  'views/pages/tour'
  'views/pages/contact'
  'views/pages/custom'
], (Backbone, Quilt, NewsView, ListenView, PhotosView, TourView, ContactView, CustomView) ->

  class Site extends Backbone.Router

    constructor: ({@app, @pages}) ->
      super

    routes:
      '': 'index'
      'home': 'index'
      ':slug': 'slug'

    slug: (slug) ->
      page = @pages.find (page) -> page.get('slug') is slug
      if not page
        @navigate('home', { trigger: true, replace: true })
      else
        @[page.get('type')](page)

    index: ->
      @changePage new Quilt.View

    news: (model) ->
      @changePage new NewsView(model: model)

    listen: (model) ->
      @changePage new ListenView
        model: model
        albums: @app.albums

    photos: (model) ->
      @changePage new PhotosView
        model: model
        photos: @app.photos

    tour: (model) ->
      @changePage new TourView
        model: model
        concerts: @app.concerts

    contact: (model) ->
      @changePage new ContactView(model: model)

    custom: (model) ->
      @changePage new CustomView(model: model)

    changePage: (view) ->
      @page?.remove().destroy()
      @app.$page.html((@page = view.render()).el)
