define [
  'quilt'
  'jquery'
  'redactor'
], (Quilt, $) ->

  attrFinder = (dataAttrs) ->
    for attr of dataAttrs
      return dataAttrs[attr] if /attr$/i.test(attr)

  Quilt.attributes.editable = (el, options) ->
    camel = (match, letter) -> (letter + '').toUpperCase()
    type = options.replace(/^([a-z])/i, camel).replace(/-([a-z])/ig, camel)
    attr = attrFinder($(el).data())
    new Editable[type]
      el: el
      model: @model
      attr: attr

  Editable = {}

  class Editor extends Quilt.View

    constructor: ({@attr}) ->
      super

    initialize: ->
      super

      attr = @$el.data('attr')
      @defaultVal = _.result(@model, 'defaults')?[attr] or 'Sample ' + @model.label

    active: false

    events: ->
      'editable:start': 'startEdit'
      'editable:end': 'endEdit'
      'mouseover': 'showBorder'
      'mouseout': 'hideBorder'

    listenBlur: ->
      $(window).on 'click.page', (e) =>
        # Return if no @$editor exists
        return unless @$editor

        # If target is not inside body, we must be clicking a removed element
        return unless $('body').find(e.target).length

        # Return if we're clicking inside @$el
        return if $(e.target).closest(@$el).length

        @endEdit()

    render: ->
      super

      @$el.addClass('editable')

      @styleDefault()

      return this

    startEdit: ->
      return if @active

      @clearDefault()

      @active = true
      @$editor = @$el
      @$el.removeClass('editable-hover')
      @$el.addClass('editable-active')

    endEdit: ->
      return unless @active

      @active = false
      @$el.removeClass('editable-active')

      [text, html] = @destroyEditor()
      [text, html] = @restoreDefault(text, html)

      @model.set(@attr, html or text)
      @model.save()

    # Add the "editable-default" class if it's the default value
    styleDefault: ->
      if $.trim(@$el.text()) is @defaultVal
        @$el.addClass('editable-default')

    # Clear value if it's the default
    clearDefault: ->
      @$el.text('') if $.trim(@$el.text()) is @defaultVal
      @$el.removeClass('editable-default')

    # Restore default value if it was left empty
    restoreDefault: (text, html) ->
      if $.trim(text) is ''
        @$el.html(text = html = @defaultVal)
        @$el.addClass('editable-default')
      return [text, html]

    destroyEditor: ->
      return unless @$editor
      [@$editor.text(), @$editor.html()]

    showBorder: (e) ->
      @$el.addClass('editable-hover') unless @active

    hideBorder: (e) ->
      @$el.removeClass('editable-hover')

    destroy: ->
      super

      $(window).off('click.page')
      @active = false
      @destroyEditor()

  class Editable.TextArea extends Editor

    listenBlur: ->
      $(window).on 'click.page', (e) =>
        # Return if no @$editor exists
        return unless @$editor

        # If target is not inside body, we must be clicking a removed element
        return unless $('body').find(e.target).length

        # Return if we're clicking inside @$el
        return if $(e.target).closest(@$el).length

        # Return if we're clicking inside a redactor modal
        return if $(e.target).closest('#redactor_modal, .redactor_dropdown').length

        @endEdit()

    render: ->
      super

      @$el.one('dblclick', => @startEdit())

      @listenBlur()

      return this

    startEdit: ->
      return if not super

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

      @$editor = null
      @$el.one('dblclick', => @startEdit())

    destroyEditor: ->
      return unless @$editor
      text = @$editor.getText()
      html = @$editor.getCode()
      @$editor.destroyEditor()
      [text, html]

    destroy: ->
      super

      @$el.off('dblclick')

  class Editable.TextInput extends Editor

    events: ->
      _.extend super,
        'dblclick': 'startEdit'

    render: ->
      super

      @listenBlur()

      return this

    startEdit: ->
      return if not super

      @$editor = @$el.attr('contenteditable', true)
      @$el.on('keydown', (e) => @checkKey(e))

      @$el.focus()

    endEdit: ->
      return if not super

      @$el.off('keydown')
      @$editor = @$el.attr('contenteditable', false)

    destroyEditor: ->
      return unless @$editor
      text = @$editor.text()
      [$.trim(text), null]

    checkKey: (e) ->
      if e.keyCode is 9
        e.preventDefault()
        @$el.trigger('editor:next')
      else if e.keyCode is 13
        e.stopPropagation()
        @endEdit()

    destroy: ->
      super

      @$el.off('keydown')

  class Editable.DateInput extends Editor

    events: ->
      _.extend super,
        'dblclick': 'startEdit'

    render: ->
      super

      @listenBlur()

      return this

  return Editable
