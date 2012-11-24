define [
  'quilt'
  'jquery_ui'
], (Quilt, $) ->

  Quilt.attributes.sortable = (el, options) ->
    new Sortable(el: el, collection: @collection, label: options)

  class Sortable extends Quilt.View

    constructor: ({@options, @parentRef, @label}) ->
      super

    initialize: ->
      super

      @$el.attr('data-sortable-label', @label)

    events:
      'sortreceive': 'receive'
      'sortupdate': 'save'

    render: ->
      super

      @$el.addClass('sortable')

      options = items: '> [data-sortable-id!=-1]'
      _.extend(options, @options)

      @$el.sortable(options)

      return this

    receive: (e, ui) ->
      # jQueryUI so *brilliantly* triggers sort events on all the sortables.
      # Make sure we're intended to receive the item.
      return unless ui.sender.data('sortable-label') is @label

      @collection.model(id: ui.item.data('sortable-id'), position: ui.item.index()).set(@parentRef)

      @collection.reorder()

    save: (e, ui) ->
      return if ui.sender or $(e.target).data('sortable-label') isnt @label

      order = @$el.sortable('toArray', attribute: 'data-sortable-id')

      @collection.get(id).set(position: i) for id, i in order

      @collection.reorder()

    destroy: ->
      # @$el.sortable('destroy')

      super
