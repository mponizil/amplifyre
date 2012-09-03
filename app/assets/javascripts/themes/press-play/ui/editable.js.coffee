define [
  'quilt'
  'jquery'
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

    render: ->
      super
      $(window).click (e) =>
        # If target has no parent, we must be clicking the original content
        return unless $(e.target).parent().length

        # Return if we're clicking inside @$el
        return if $(e.target).closest(@$el).length

        # Return if we're clicking inside a redactor modal
        return if $(e.target).closest('#redactor_modal, .redactor_dropdown').length

        # Return if no @editor exists
        return unless @editor

        @endEdit()
      @

    startEdit: (e) ->
      @undelegateEvents()
      @hideBorder()

      @['start' + @type]()

    # Use redactor for textareas
    startTextArea: ->
      content = @$el.html()
      @editor = $('<div>').html(content)
      @$el.empty().append(@editor)
      @editor.redactor(focus: true)

    startTextInput: ->
      content = @$el.html()
      @editor = $('<input>').attr('type','text').addClass('editable').val(content)
      @$el.empty().append(@editor)
      @editor.focus()

    startDateInput: ->
      console.log 'start date input'

    endEdit: ->
      @['end' + @type]()
      @editor = null

      @delegateEvents()

    endTextArea: ->
      content = @editor.getCode()
      @editor.destroyEditor()
      @$el.trigger('update', [content])

    endTextInput: ->
      content = @editor.val()
      @editor.remove()
      @$el.trigger('update', [content])

    endDateInput: ->
      console.log 'end date input'

    showBorder: (e) ->
      @$el.addClass('editable')

    hideBorder: (e) ->
      @$el.removeClass('editable')
