define [
  'patches/destroy'
  'patches/progress-bar'
  'themes/common/views/helper-view'
], (Destroy, ProgressBar, HelperView) ->

  class PhotoView extends HelperView

    inject: ->
      @$el.append("<a class='remove' data-ref='destroy'>&times;</a>")
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
