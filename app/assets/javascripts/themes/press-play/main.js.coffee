define [
  'jquery'
  'views/app'
], ($, App) ->

  $ ->

    $.ajaxSetup
      headers:
        'X-Requested-With': 'XMLHttpRequest'

    new App
      el: 'body'
      bootstrap: JSON.parse($('#bootstrap').html())
      root: '/'
    .render()
