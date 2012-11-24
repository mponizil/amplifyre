define [
  'quilt'
  'views/helper-view'
], (Quilt, HelperView) ->

  class EditPage extends HelperView

    inject: ->
      @$el.prepend @$controls = $("<div class='clearfix edit-mode'></div>")
      @$controls.append @$controls_left = $('''
        <div class='left'>
          <h2 data-attr='title' data-editable='text-input'></h2>
        </div>''')
      @$controls.append @$controls_right = $('''
        <div class='right'>
          <button class='delete' data-destroy>Delete Page</button>
        </div>''')

    render: ->
      super

      @views.push(new Quilt.View
        el: @$controls
        model: @model
      .render())

      return this
