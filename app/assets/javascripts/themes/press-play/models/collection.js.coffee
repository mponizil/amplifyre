define ['backbone'], (Backbone) ->

  class Collection extends Backbone.Collection

    url: -> 'http://amplifyre.dev'
