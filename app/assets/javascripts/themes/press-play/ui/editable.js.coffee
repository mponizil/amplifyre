define [
  'quilt'
  'jquery'
  'redactor'
], (Quilt, $) ->

  # TODO: This should be done somewhere else
  Quilt.attributes.editable = (el, options) ->
    if window.location.pathname.indexOf('/edit') < 0
      $(el).removeAttr('data-editable')
    else
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
      @defaultVal = _.result(@model, 'defaults')?[attr] or 'Sample ' + @model.label

    events: ->
      'editable:start': 'startEdit'
      'editable:end': 'endEdit'
      'mouseover': 'showBorder'
      'mouseout': 'hideBorder'

    render: ->
      super

      @$el.addClass('editable')

      return this

    startEdit: ->
      return if @active

      @active = true
      @$el.removeClass('editable-hover')
      @$el.addClass('editable-active')

    endEdit: ->
      return unless @active

      @active = false
      @$el.removeClass('editable-active')

    showBorder: (e) ->
      @$el.addClass('editable-hover') unless @active

    hideBorder: (e) ->
      @$el.removeClass('editable-hover')

  class Editable.TextArea extends Editor

    events: ->
      _.extend super,
        'dblclick': 'startEdit'

    render: ->
      super

      if $.trim(@$el.text()) is @defaultVal
        @$el.addClass('editable-default')

      $(window).click (e) =>
        # Return if no @$editor exists
        return unless @$editor

        # If target is not inside body, we must be clicking a removed element
        return unless $('body').find(e.target).length

        # Return if we're clicking inside @$el
        return if $(e.target).closest(@$el).length

        # Return if we're clicking inside a redactor modal
        return if $(e.target).closest('#redactor_modal, .redactor_dropdown').length

        @endEdit()

      return this

    startEdit: ->
      return if not super

      # Clear value if it's the default
      @$el.text('') if $.trim(@$el.text()) is @defaultVal
      @$el.removeClass('editable-default')

      html = @$el.html()
      @$editor = $('<div>').html(html)
      @$el.empty().append(@$editor)
      @$editor.redactor
        focus: true
        convertDivs: false
        buttons:
          ['html', '|', 'formatting', '|', 'bold', 'italic', '|',
           'image', 'video', 'file', 'link', '|',
           'fontcolor', 'backcolor', '|', 'alignment']
        allowedTags:
          ['span', 'div', 'a', 'br', 'p', 'b', 'i', 'u', 'img', 'video',
           'audio', 'object', 'embed', 'param', 'ul', 'ol', 'li', 'hr',
           'pre', 'strong', 'em', 'table', 'tr', 'td', 'th', 'tbody',
           'thead', 'tfoot', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6']

    endEdit: ->
      return if not super

      html = @$editor.getCode()
      text = @$editor.getText()
      @$editor.destroyEditor()

      # Restore default value if it was left empty
      if $.trim(text) is ''
        @$el.html(text = html = @defaultVal)
        @$el.addClass('editable-default')

      @$el.trigger('update', [html])

      @$editor = null
      @$el.one('dblclick', => @startEdit())

  class Editable.TextInput extends Editor

    events: ->
      _.extend super,
        'dblclick': 'startEdit'

    render: ->
      super

      if $.trim(@$el.text()) is @defaultVal
        @$el.addClass('editable-default')

      $(window).click (e) =>
        # Return if no @$editor exists
        return unless @$editor

        # If target is not inside body, we must be clicking a removed element
        return unless $('body').find(e.target).length

        # Return if we're clicking inside @$el
        return if $(e.target).closest(@$el).length

        @endEdit()

      return this

    startEdit: ->
      return if not super

      @$editor = @$el.attr('contenteditable', true)
      @$el.on('keydown', (e) => @checkKey(e))

      # Clear value if it's the default
      @$el.text('') if $.trim(@$el.text()) is @defaultVal
      @$el.removeClass('editable-default')

      @$el.focus()

    endEdit: ->
      return if not super

      text = @$editor.text()

      # Restore default value if it was left empty
      if $.trim(text) is ''
        @$el.html(text = @defaultVal)
        @$el.addClass('editable-default')

      @$el.trigger('update', [text])

      @$el.off('keydown')
      @$editor = @$el.attr('contenteditable', false)

    checkKey: (e) ->
      if e.keyCode is 9
        e.preventDefault()
        @$el.trigger('editor:next')
      else if e.keyCode is 13
        e.stopPropagation()
        @endEdit()

  class Editable.DateInput extends Editor

    events: ->
      _.extend super,
        'blur': 'endEdit'

    render: ->
      super

      @$editor = @$el.attr('contenteditable', true)

      return this

    endEdit: ->
      return if not super

      content = @$editor.html()
      @$el.trigger('update', [content])

  return Editable
