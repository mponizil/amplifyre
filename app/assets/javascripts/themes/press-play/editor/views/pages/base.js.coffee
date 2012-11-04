define [
  'editor/views/view'
], (View) ->

  class EditPage extends View

    controlsJst: -> '''
      <div class='right'>
        <button class='delete' data-destroy>Delete Page</button>
      </div>
      '''

    render: ->
      super

      @$page_controls = $('<div>').addClass('clearfix')
      @$page_controls.prependTo(@$('[data-page-container]'))

      @views.push(new Quilt.View
        el: @$page_controls
        template: @controlsJst
        model: @model
        collection: @collection
      .render())

      return this
