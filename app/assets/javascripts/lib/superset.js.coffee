define [
  'underscore'
  'backbone'
], (_, Backbone) ->

  class Subset

    constructor: ({@superset, @collection, @filter}) ->
      @listenTo(@superset, 'add', @add)
      @listenTo(@superset, 'remove', @remove)
      @listenTo(@superset, 'reset', @reset)

      @listenTo(@superset, 'dispose', @dispose)
      @listenTo(@collection, 'dispose', @dispose)

    add: (model, superset) ->
      @collection.add(model) if @filter.call(@superset, model)

    remove: (model, superset) ->
      @collection.remove(model)

    reset: (superset) ->
      @collection.reset(superset.models)

    dispose: ->
      @stopListening()
      @trigger('dispose')

  _.extend Subset::, Backbone.Events

  class Superset extends Backbone.Collection

    subset: (label, filter) ->
      @subsets or= {}

      if _.isFunction(label)
        filter = label
        label = +new Date

      filter or= @subsets[label]
      if not _.isFunction(filter)
        throw new Error("No filter method found with label, #{label}.")

      filter = _.bind(filter, @)

      # TOBRAD: using `@constructor` means the sub-collection will have the same prototype
      # as it's parent (with all the same subset methods available...)
      collection = new @constructor(@filter(filter))
      new Subset({superset: @, collection, filter})

      return collection

    dispose: ->
      # TODO: re-structure the different base models so
      # they can all benefit from `Model#dispose`.
      @stopListening()
      @trigger('dispose', @)
