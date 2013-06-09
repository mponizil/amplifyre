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
      homepage = @pages.homepage()
      if homepage
        @navigate(homepage.get('slug'), {trigger: true, replace: true})
      else
        @trigger('page:change', 'landing')

    slug: (slug) ->
      page = @pages.findWhere({ slug })
      if page
        @trigger('page:change', page.get('category'), page)
      else
        @navigate('home', {trigger: true, replace: true})
