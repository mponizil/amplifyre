define ['supermodel'], (Supermodel) ->
  
  class Model extends Supermodel.Model

    urlPrefix: -> '/api/v1/'

    label: 'item'

    name: 'item'

    toJSON: (options) ->
      if options?.position
        json = super
      else
        json = {}
        json[@name] = super

      return json
