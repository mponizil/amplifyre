define [
  'patches/editable'
  'patches/progress-bar'
  'patches/destroy'
  'themes/common/views/helper-view'
], (Editable, ProgressBar, Destroy, HelperView) ->

  class EditTrackView extends HelperView

    initialize: ->
      super
      @listenTo(@model, 'change:id', @alter)

    alter: ->
      @$el.attr('data-sortable-id', @model.id)

    inject: ->
      @$el.append('''
        <div class='remove'>
          <i class='icon-remove icon-white' data-ref='destroy'>&times;</i>
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
