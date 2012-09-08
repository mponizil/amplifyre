define [
  'jquery'
  'backbone'
  'router'
  'models/pages'
  'editor/views/app'
], ($, Backbone, Router, Pages, EditApp) ->

  $ ->

    $.ajaxSetup
      headers:
        'X-Requested-With': 'XMLHttpRequest'

    bootstrap = JSON.parse($('#bootstrap').html())

    pages = new Pages(bootstrap.pages)

    router = new Router
      pages: pages
    Backbone.history or= new Backbone.History()
    Backbone.history.options = {root: '/edit/'}

    new EditApp
      el: 'body'
      bootstrap: bootstrap
      router: router
    .render()
