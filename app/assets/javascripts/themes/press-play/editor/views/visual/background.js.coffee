define [
  'ui/fileupload'
  'views/helper-view'
], (Fileupload, HelperView) ->

  class BackgroundView extends HelperView

    inject: ->
      @$el.append $('''
        <div class='abs-bot-right' style='z-index:999'>
          <input type='file' name='background_file' data-ref='upload' />
        </div>''')

    render: ->
      super

      @views.push(new Fileupload
        el: @$upload
        model: @model
      .render())

      return this
