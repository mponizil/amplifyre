define ['backbone'], (Backbone) ->

  class Collection extends Backbone.Collection

    urlRoot: -> 'api/v1/'

    url: -> _.result(@, 'urlRoot')