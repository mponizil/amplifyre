define [
  'backbone'
], (Backbone) ->

  class Router extends Backbone.Router

    constructor: ({@pages}) ->
      super

    initialize: ->
      super

      @pages.on('change:slug', (page, slug) ->
        @navigate(slug, { trigger: true, replace: true })
      , @)

    routes:
      '': 'index'
      'home': 'index'
      ':slug': 'slug'

    index: ->
      @trigger('page:change', 'index')

    slug: (slug) ->
      page = @pages.find (page) -> page.get('slug') is slug
      if not page
        @navigate('home', { trigger: true, replace: true })
      else
        @trigger('page:change', page.get('category'), page)
