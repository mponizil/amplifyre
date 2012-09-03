define [
  'quilt'
  'jquery'
  'redactor'
], (Quilt, $) ->

  # TODO: This should be done somewhere else
  if window.location.pathname.indexOf('/edit/') >= 0
    Quilt.attributes.editable = (el, options) ->
      camel = (match, letter) -> (letter + '').toUpperCase()
      type = options.replace(/^([a-z])/i, camel).replace(/-([a-z])/ig, camel)
      new Editable[type]
        el: el
        model: @model

  Editable = {}

  class Editor extends Quilt.View

    events: ->
      'mouseover': 'showBorder'
      'mouseout': 'hideBorder'

    showBorder: (e) ->
      @$el.addClass('editable')

    hideBorder: (e) ->
      @$el.removeClass('editable')

  class Editable.TextArea extends Editor

    events: ->
      _.extend super,
        'click': 'startEdit'

    render: ->
      super

      $(window).click (e) =>
        # Return if no @editor exists
        return unless @editor

        # If target is not inside body, we must be clicking a removed element
        return unless $('body').find(e.target).length

        # Return if we're clicking inside @$el
        return if $(e.target).closest(@$el).length

        # Return if we're clicking inside a redactor modal
        return if $(e.target).closest('#redactor_modal, .redactor_dropdown').length

        @endEdit()

      @

    startEdit: ->
      @$el.off('click')

      content = @$el.html()
      @editor = $('<div>').html(content)
      @$el.empty().append(@editor)
      @editor.redactor(focus: true)

    endEdit: ->
      content = @editor.getCode()
      @editor.destroyEditor()
      @$el.trigger('update', [content])

      @editor = null
      @$el.click => @startEdit()

  class Editable.TextInput extends Editor

    events: ->
      _.extend super,
        'blur': 'endEdit'

    render: ->
      super

      @editor = @$el.attr('contenteditable', true)

      @

    endEdit: ->
      content = @editor.html()
      @$el.trigger('update', [content])

  class Editable.DateInput extends Editor

    events: ->
      _.extend super,
        'blur': 'endEdit'

    render: ->
      super

      @editor = @$el.attr('contenteditable', true)

      @

    endEdit: ->
      content = @editor.html()
      @$el.trigger('update', [content])

  return Editable
