define [
  'quilt'
  'fileupload'
], (Quilt, $) ->

  Quilt.attributes.fileupload = (el, options) ->
    new Fileupload(el: el, model: @model, collection: @collection)

  class Fileupload extends Quilt.View

    constructor: ({@formData}) ->
      super

    events:
      'fileuploaddone': 'done'

    render: ->
      options =
        dataType: 'json'
        type: 'POST'
      options.formData = @formData if @formData

      if @model
        options.url = @model.url()
        options.type = 'PUT' unless @model.isNew()
      else
        options.url = @collection.url()

      @$el.fileupload(options)

      return this

    done: (e, data) ->
      if @model
        @model.set(data.result)
      else
        @collection.add(data.result)
