define [
  'quilt'
  'views/helper-view'
], (Quilt, HelperView) ->

  class EditPage extends HelperView

    inject: ->
      @$el.prepend(@$controls = $('''
        <div class="clearfix edit-mode">
          <div class='left' data-ref='controls_left'>
            <h2 data-attr='title' data-editable='text-input'></h2>
          </div>
          <div class='right' data-ref='controls_right'>
            <button class='delete' data-destroy>Delete Page</button>
          </div>
        </div>'''))

    render: ->
      super

      @views.push(new Quilt.View
        el: @$controls
        model: @model
      .render())

      return this
