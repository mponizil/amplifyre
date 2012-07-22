define [
  'jquery'
  'views/app'
], ($, App) ->

  $ ->

    new App({ el: "body" }).render();