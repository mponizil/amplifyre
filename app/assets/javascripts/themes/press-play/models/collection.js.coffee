define [
  'backbone'
  'moment'
], (Backbone, moment) ->

  class Collection extends Backbone.Collection

    url: -> '/api/v1/'

    comparator: (model1, model2) ->
      moment(model1.get('created_at')).unix() < moment(model2.get('created_at')).unix()

    reorder: ->
      data = {}
      data[@name] = @toJSON(position: true)
      $.ajax
        type: 'PUT'
        url: @url() + '/reorder'
        contentType: 'application/json'
        dataType: 'json'
        data: JSON.stringify(data)
