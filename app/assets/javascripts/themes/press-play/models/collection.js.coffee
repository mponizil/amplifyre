define [
  'backbone'
  'moment'
], (Backbone, moment) ->

  class Collection extends Backbone.Collection

    url: -> 'http://amplifyre.dev'

    comparator: (model1, model2) ->
      moment(model1.get('created_at')).unix() < moment(model2.get('created_at')).unix()
