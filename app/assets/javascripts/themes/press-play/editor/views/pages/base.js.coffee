define [
  'quilt'
  'at-pp/views/helper-view'
], (Quilt, HelperView) ->

  class EditPage extends HelperView

    inject: ->
      @$el.prepend('''
        <div class='well well-small clearfix' data-ref='controls'>
          <div class='pull-left' data-ref='controls_left'>
            <h2 data-attr='title' data-editable='text-input'></h2>
          </div>
          <div class='pull-right' data-ref='controls_right'>
            <button type='button' class='btn btn-danger' data-destroy>Delete Page</button>
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
