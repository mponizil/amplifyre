define [
  'quilt'
  'jquery_ui'
], (Quilt, $) ->

  Quilt.patches.sortable = (el, options) ->
    new Sortable(el: el, collection: @collection, label: options)

  class Sortable extends Quilt.View

    constructor: ({@options, @parentRef, @label}) ->
      super

    initialize: ->
      super

      @$el.attr('data-sortable-label', @label)

    events:
      'sortupdate': 'update'

    render: ->
      super

      @$el.addClass('sortable')

      options =
        items: '> [data-sortable-id!=-1]'
      _.extend(options, @options)

      @$el.sortable(options)

      return this

    update: (e, ui) ->
      # jQueryUI so *brilliantly* triggers sort events on all the sortables.
      # Make sure we're intended to receive the item.
      return if $(e.target).data('sortable-label') isnt @label

      order = @$el.sortable('toArray', attribute: 'data-sortable-id')

      # If the item is from another sortable, it won't be in `@collection` yet
      @collection.get(id)?.set(position: i) for id, i in order

      # If the item is from another sortable, move it to `@collection` by setting `@parentRef`
      if ui.sender
        # Creating the model is the same as finding by id because of Supermodel
        model = @collection.model(id: ui.item.data('sortable-id'))

        attrs = _.extend(@parentRef, position: ui.item.index())
        model.set(attrs)

      @collection.reorder()

    destroy: ->
      # @$el.sortable('destroy')

      super
