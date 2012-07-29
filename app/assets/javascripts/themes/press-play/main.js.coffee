define [
  'jquery'
  'views/app'
], ($, App) ->

  $ ->

    new App
      el: 'body'
      bootstrap: JSON.parse($('#bootstrap').html())
    .render()
