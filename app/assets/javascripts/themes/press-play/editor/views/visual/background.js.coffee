define [
  'ui/fileupload'
  'ui/progress-bar'
  'at-pp/views/helper-view'
], (Fileupload, ProgressBar, HelperView) ->

  class BackgroundView extends HelperView

    inject: ->
      @$el.append $('''
        <div class='abs-bot-right' style='z-index:999'>
          <input type='file' name='background_file' data-ref='upload' />
        </div>''')
      @$el.append("<div class='progress' data-ref='progress'><div>")

    render: ->
      super

      @views.push(new ProgressBar
        el: @$progress
        $target: @$bg_inactive.add(@$bg_active)
        model: @model
      .render())
      @views.push(new Fileupload
        el: @$upload
        model: @model
      .render())

      return this
