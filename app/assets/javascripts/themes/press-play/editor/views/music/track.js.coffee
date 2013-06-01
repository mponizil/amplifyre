define [
  'patches/editable'
  'patches/progress-bar'
  'patches/destroy'
  'at-common/views/helper-view'
], (Editable, ProgressBar, Destroy, HelperView) ->

  class TrackView extends HelperView

    inject: ->
      @$el.attr('data-sortable-id', @model.id)
      @$el.append('''
        <div class='remove'>
          <i class='icon-remove icon-white' data-ref='destroy'></i>
        </div>''')
      @$el.append("<div data-ref='progress'><div>")

    render: ->
      super

      @views.push(new Editable.TextInput
        el: @$title
        model: @model
        attr: 'title'
      .render())

      @views.push(new ProgressBar
        el: @$progress
        $target: @$el.children('span').add(@$destroy)
        model: @model
      .render())

      @views.push(new Destroy
        el: @$destroy
        model: @model
      .render())

      return this
