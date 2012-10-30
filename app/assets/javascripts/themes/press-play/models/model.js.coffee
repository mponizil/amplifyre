define ['supermodel'], (Supermodel) ->
  
  class Model extends Supermodel.Model

    urlRoot: -> '/api/v1/'

    label: 'item'

    name: 'item'

    toJSON: ->
      json = {}
      json[@name] = super
      json
