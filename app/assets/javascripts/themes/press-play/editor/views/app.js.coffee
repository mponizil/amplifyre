define [
  'views/app'
], (App) ->

  class EditApp extends App

    initialize: ->
      super

      @router.on('change:page', (page, model) ->
        console.log page, model
      , @)
