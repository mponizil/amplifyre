define [
  'patches/editable'
  'patches/destroy'
  'at-common/views/helper-view'
], (Editable, Destroy, HelperView) ->

  class PostView extends HelperView

    inject: ->
      @$el.prepend('''
        <div class='pull-right' data-ref='destroy'>
          <button type='button' class='btn btn-danger'>Delete</button>
        </div>''')

    render: ->
      super

      @views.push(new Editable.TextInput
        el: @$title
        model: @model
        attr: 'title'
      .render())

      @views.push(new Editable.TextArea
        el: @$body
        model: @model
        attr: 'body'
      .render())

      @views.push(new Destroy
        el: @$destroy
        model: @model
      .render())

      return this
