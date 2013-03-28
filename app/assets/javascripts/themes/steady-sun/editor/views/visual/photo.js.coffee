define [
  'ui/destroy'
  'ui/progress-bar'
  'themes/common/views/helper-view'
], (Destroy, ProgressBar, HelperView) ->

  class PhotoView extends HelperView

    inject: ->
      @$el.append('''
        <div class='remove'>
          <i class='icon-remove icon-white' data-ref='destroy'></i>
        </div>''')
      @$el.append("<div class='progress' data-ref='progress'><div>")

    render: ->
      super

      @views.push(new ProgressBar
        el: @$progress
        $target: @$el.children('a').add(@$destroy)
        model: @model
      .render())
      @views.push(new Destroy
        el: @$destroy
        model: @model
      .render())

      return this
