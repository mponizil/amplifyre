define ['supermodel'], (Supermodel) ->
  
  class Model extends Supermodel.Model

    urlPrefix: -> '/api/v1/'

    label: 'item'

    name: 'item'

    toJSON: (options) ->
      if options.position
        json = {}
        json[@name] = super
      else
        json = super

      return json
