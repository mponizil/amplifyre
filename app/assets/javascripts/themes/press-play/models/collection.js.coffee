define [
  'backbone'
  'moment'
], (Backbone, moment) ->

  class Collection extends Backbone.Collection

    url: -> window.location.origin

    comparator: (model1, model2) ->
      moment(model1.get('created_at')).unix() < moment(model2.get('created_at')).unix()
