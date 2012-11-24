define [
  'quilt'
  'jquery_ui'
], (Quilt, $) ->

  Quilt.attributes.sortable = (el, options) ->
    new Sortable(el: el, collection: @collection)

  class Sortable extends Quilt.View

    events:
      'sortupdate': 'save'

    render: ->
      super

      @$el.addClass('sortable')

      @$el.sortable
        items: '> [data-sortable-id!=-1]'

      return this

    save: (e) ->
      order = @$el.sortable('toArray', attribute: 'data-sortable-id')

      @collection.get(id).set(position: i) for id, i in order

      @collection.reorder()

    destroy: ->
      # @$el.sortable('destroy')

      super
