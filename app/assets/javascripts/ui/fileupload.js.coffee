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
      'fileuploadsend': 'send'
      'fileuploadprogress': 'progress'
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

    send: (e, data) ->
      if @model
        @model.trigger('request')
      else
        model = @collection.add()
        model.trigger('request', model)

        # Had to make a fresh model, store the cid for later
        data.data.cid = model.cid

    progress: (e, data) ->
      model = @model or @collection.get(data.data.cid)
      pct = parseInt(data.loaded / data.total * 100, 10)
      model.trigger('progress', model, pct)

    done: (e, data) ->
      if @model
        model = @model.set(data.result)
      else
        model = @collection.get(data.data.cid)
        model.set(data.result)

      model.trigger('sync')
