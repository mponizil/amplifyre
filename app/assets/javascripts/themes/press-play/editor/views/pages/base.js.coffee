define [
  'views/helper-view'
], (View) ->

  class EditPage extends HelperView

    controlsJst: -> '''
      <div class='left' data-ref='controls_left'>
        <h2 data-attr='title' data-editable='text-input'></h2>
      </div>
      <div class='right' data-ref='controls_right'>
        <button class='delete' data-destroy>Delete Page</button>
      </div>'''

    render: ->
      super

      @$('[data-page-container]').prepend($controls = $('<div>').addClass('clearfix edit-mode'))

      @views.push(new Quilt.View
        el: $controls
        template: @controlsJst
        model: @model
      .render())

      return this
