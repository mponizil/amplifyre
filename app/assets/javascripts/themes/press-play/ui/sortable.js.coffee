define [
  'quilt'
  'jquery_ui'
], (Quilt, $) ->

  Quilt.attributes.sortable = (el, options) ->
    new Sortable(el: el, collection: @collection)

  class Sortable extends Quilt.View

    render: ->
      @$el.addClass('sortable')
      @$el.sortable
        update: (e) => @save(e)
      return this

    save: (e) ->
      order = @$el.sortable('toArray', attribute: 'data-sortable-id')

      @collection.get(id).set(position: i) for id, i in order

      @collection.reorder()

    destroy: ->
      @$el.sortable('destroy')

      super
