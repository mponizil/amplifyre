define ['supermodel'], (Supermodel) ->
  
  class Model extends Supermodel.Model

    urlPrefix: -> '/api/v1/'

    label: 'item'

    name: 'item'

    toJSON: ->
      json = {}
      json[@name] = super
      json
