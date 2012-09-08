define [
  'jquery'
  'backbone'
  'router'
  'models/pages'
  'views/app'
], ($, Backbone, Router, Pages, App) ->

  $ ->

    $.ajaxSetup
      headers:
        'X-Requested-With': 'XMLHttpRequest'

    bootstrap = JSON.parse($('#bootstrap').html())

    pages = new Pages(bootstrap.pages)

    router = new Router
      pages: pages
    Backbone.history or= new Backbone.History()
    Backbone.history.options = {root: '/'}

    new App
      el: 'body'
      bootstrap: bootstrap
      router: router
    .render()
