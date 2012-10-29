define [
  'quilt'
  'fileupload'
], (Quilt, $) ->

  Quilt.attributes.fileupload = (el, options) ->
    new Fileupload(el: el, collection: @collection)

  class Fileupload extends Quilt.View

    events:
      'fileuploaddone': 'done'

    render: ->
      @$el.fileupload(dataType: 'json', url: @collection.url())
      return this

    done: (e, data) ->
      @collection.add(data.result)
