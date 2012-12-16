define [
  'ui/destroy'
  'ui/progress-bar'
  'at-pp/views/helper-view'
], (Destroy, ProgressBar, HelperView) ->

  class PhotoView extends HelperView

    inject: ->
      @$el.append("<div class='delete edit-mode' data-ref='destroy'>X</div>")
      @$el.append("<div data-ref='progress'><div>")

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
