define [
  'quilt'
  'redactor'
], (Quilt, $) ->

  # TODO: This should be done somewhere else
  if window.location.pathname.indexOf('/edit/') >= 0
    Quilt.attributes.editable = (el, options) ->
      camel = (match, letter) -> (letter + '').toUpperCase()
      new Editable
        el: el
        model: @model
        type: options.replace(/^([a-z])/i, camel).replace(/-([a-z])/ig, camel)

  class Editable extends Quilt.View

    constructor: ({@type}) ->
      super

    events:
      'click': 'startEdit'
      'mouseover': 'showBorder'
      'mouseout': 'hideBorder'

    startEdit: (e) ->
      @undelegateEvents()
      @hideBorder()

      editor = @['start' + @type]()

      $(window).on 'click.away', (e) =>
        if not $(e.target).closest(@$el).length
          @endEdit(editor)

    # Use redactor for textareas
    startTextArea: ->
      content = @$el.html()
      editor = $('<div>').html(content)
      @$el.empty().append(editor)
      editor.redactor(focus: true)
      editor

    startTextInput: ->
      console.log 'start text input'

    startDateInput: ->
      console.log 'start date input'

    endEdit: (editor) ->
      $(window).off('click.away')
      
      @['end' + @type](editor)

      @delegateEvents()

    endTextArea: (editor) ->
      content = editor.getCode()
      editor.destroyEditor()
      @$el.html(content)

    endTextInput: (editor) ->
      console.log 'end text input'

    endDateInput: (editor) ->
      console.log 'end date input'

    showBorder: (e) ->
      @$el.addClass('editable')

    hideBorder: (e) ->
      @$el.removeClass('editable')
