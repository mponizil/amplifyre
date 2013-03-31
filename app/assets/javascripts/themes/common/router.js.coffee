define [
  'backbone'
], (Backbone) ->

  class Router extends Backbone.Router

    constructor: ({@band_site, @pages}) ->
      super

    initialize: ->
      super

      @pages.on('change:slug', (page, slug) ->
        @navigate(slug, { trigger: true, replace: true })
      , @)
      @pages.on('destroy', ->
        @navigate('home', { trigger: true, replace: true })
      , @)

    routes:
      '': 'home'
      'home': 'home'
      ':slug': 'slug'

    home: ->
      if @band_site.get('homepage') is 'index'
        @trigger('page:change', 'index')
      else
        page = @pages.find (page) => page.get('category') is @band_site.get('homepage')
        @navigate(page.get('slug'), {trigger: true, replace: true})

    slug: (slug) ->
      page = @pages.find (page) -> page.get('slug') is slug
      if not page
        @navigate('home', {trigger: true, replace: true})
      else
        @trigger('page:change', page.get('category'), page)
