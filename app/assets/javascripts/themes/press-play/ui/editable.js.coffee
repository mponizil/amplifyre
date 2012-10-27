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

    active: false

    initialize: ->
      super

      attr = @$el.data('attr')
      @defaultVal = _.result(@model, 'defaults')[attr]

    events: ->
      'mouseover': 'showBorder'
      'mouseout': 'hideBorder'

    startEdit: ->
      @active = true
      @$el.removeClass('editor-hover')
      @$el.addClass('editor-active')

    endEdit: ->
      @active = false
      @$el.removeClass('editor-active')

    showBorder: (e) ->
      @$el.addClass('editor-hover') unless @active

    hideBorder: (e) ->
      @$el.removeClass('editor-hover')

  class Editable.TextArea extends Editor

    render: ->
      super

      if $.trim(@$el.text()) is @defaultVal
        @$el.addClass('editor-default')

      @$el.one('dblclick', => @startEdit())

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
      super

      # Clear value if it's the default
      @$el.text('') if $.trim(@$el.text()) is @defaultVal
      @$el.removeClass('editor-default')

      html = @$el.html()
      @editor = $('<div>').html(html)
      @$el.empty().append(@editor)
      @editor.redactor(focus: true)

    endEdit: ->
      super

      html = @editor.getCode()
      text = @editor.getText()
      @editor.destroyEditor()

      # Restore default value if it was left empty
      if $.trim(text) is ''
        @$el.text(text = html = @defaultVal)
        @$el.addClass('editor-default')

      @$el.trigger('update', [html])

      @editor = null
      @$el.one('dblclick', => @startEdit())

  class Editable.TextInput extends Editor

    events: ->
      _.extend super,
        'dblclick': 'startEdit'

    render: ->
      super

      if $.trim(@$el.text()) is @defaultVal
        @$el.addClass('editor-default')

      $(window).click (e) =>
        # Return if no @editor exists
        return unless @editor

        # If target is not inside body, we must be clicking a removed element
        return unless $('body').find(e.target).length

        # Return if we're clicking inside @$el
        return if $(e.target).closest(@$el).length

        @endEdit()

      @

    startEdit: ->
      super

      @editor = @$el.attr('contenteditable', true)
      @$el.on('keydown', (e) => @checkTab(e))

      # Clear value if it's the default
      @$el.text('') if $.trim(@$el.text()) is @defaultVal
      @$el.removeClass('editor-default')

    endEdit: ->
      super

      html = @editor.html()
      text = @editor.text()

      # Restore default value if it was left empty
      if $.trim(text) is ''
        @$el.text(html = text = @defaultVal)
        @$el.addClass('editor-default')

      @$el.trigger('update', [html])

      @$el.off('keydown')
      @editor = @$el.attr('contenteditable', false)

    checkTab: (e) ->
      if (e.keyCode is 9)
        e.preventDefault()
        @$el.trigger('editor:next')

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
