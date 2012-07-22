define [
  'backbone'
  'views/pages/home'
  'views/pages/news'
  'views/pages/listen'
  'views/pages/photos'
  'views/pages/tour'
  'views/pages/contact'
  'views/pages/custom'
], (Backbone, HomeView, NewsView, ListenView, PhotosView, TourView, ContactView, CustomView) ->

  class Site extends Backbone.Router

    routes:
      '': 'index'
      'home': 'index'
      ':slug': 'page'

    page: (slug) ->
      page = @pages.find (page) -> page.get('slug') is slug
      if not page
        @navigate('home'
          trigger: true
          replace: true
        )

      @[@page.get('type')](@page)

    index: ->
      @changePage(new HomeView)

    news: (model) ->
      @changePage(new NewsView(model: model))

    listen: (model) ->
      @changePage(new ListenView(model: model))

    photos: (model) ->
      @changePage(new PhotosView(model: model))

    tour: (model) ->
      @changePage(new TourView(model: model))

    contact: (model) ->
      @changePage(new ContactView(model: model))

    custom: (model) ->
      @changePage(new CustomView(model: model))

    changePage: (view) ->
      @page?.remove().destroy()
      @app.$page.html((@page = view.render()).el)