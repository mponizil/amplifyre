define [
  'quilt'
  'at-pp/views/helper-view'
], (Quilt, HelperView) ->

  class EditPage extends HelperView

    inject: ->
      @$el.prepend('''
        <div class='clearfix edit-mode' data-ref='controls'>
          <div class='left' data-ref='controls_left'>
            <h2 data-attr='title' data-editable='text-input'></h2>
          </div>
          <div class='right' data-ref='controls_right'>
            <button class='delete' data-destroy>Delete Page</button>
          </div>
        </div>''')
      @cache()

    render: ->
      super

      @views.push(new Quilt.View
        el: @$controls
        model: @model
      .render())

      return this
