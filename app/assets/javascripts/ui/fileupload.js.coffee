define [
  'quilt'
  'fileupload'
], (Quilt, $) ->

  # Bytes per second, estimated upload speed of server to s3
  bps = 480
  start = null

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
      start = +new Date

      if @model
        @model.trigger('request')
      else
        # TODO: @collection.createLocal()
        model = @collection.add().last()
        model.trigger('request', model)
        data.data.cid = model.cid

    progress: (e, data) ->
      model = @model or @collection.get(data.data.cid)

      # TODO: cleanup
      pctSent = parseInt(data.loaded / data.total * 100, 10)
      if pctSent < 100
        pct = pctSent
      else
        if not data.waitingInterval
          data.waitingInterval = setInterval(=>
            @progress(e, data)
          , 100)
        elapsed = +new Date - start
        pctStored = parseInt((bps * elapsed) / data.total * 100, 10)
        pct = (pctSent + pctStored) / 2

      model.trigger('progress', model, pct)

    done: (e, data) ->
      clearInterval(data.waitingInterval) if data.waitingInterval

      if @model
        model = @model.set(data.result)
      else
        model = @collection.get(data.data.cid).set(data.result)

      model.trigger('sync')
