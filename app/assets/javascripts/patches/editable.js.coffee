define [
  'quilt'
  'jquery'
  'moment'
  'lib/jquery-trim-html'
  'redactor'
], (Quilt, $, moment) ->

  upper = (match, letter) -> "#{letter}".toUpperCase()
  camelize = (str) -> str.replace(/^([a-z])/i, upper).replace(/-([a-z])/ig, upper)

  # Return the value of the data attribute that ends with `attr`.
  findAttr = (dataAttrs) ->
    return dataAttrs[attr] for attr of dataAttrs when /attr$/i.test(attr)

  Quilt.patches.editable = (el, options) ->
    type = camelize(options)
    attr = findAttr($(el).data())
    new Editable[type]({el, @model, attr})

  Editable = {}

  class Editor extends Quilt.View

    constructor: ({@attr}) ->
      super

    initialize: ->
      super

      @defaultVal = _.result(@model, 'defaults')?[@attr] or "Sample #{@model.label}"

    active: false

    events: ->
      'click': 'stopPropagation'
      'editable:start': 'startEdit'
      'editable:end': 'endEdit'

    stopPropagation: (e) -> e.stopPropagation()

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

      @$el.one('dblclick', @startEdit)
      @listenBlur()

      return this

    startEdit: =>
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

      @$el.one('dblclick', @startEdit)

    isDefault: -> $.trim(@$el.text()) is @defaultVal

    styleDefault: ->
      if @isDefault()
        @$el.addClass('editable-default')

    clearDefault: ->
      @$el.html("") if @isDefault()
      @$el.removeClass('editable-default')

    restoreDefault: (text, html) ->
      if text is ""
        @$el.html(text = html = @defaultVal)
        @$el.addClass('editable-default')
      return [text, html]

    destroyEditor: ->
      return unless @$editor
      [$.trim(@$editor.text()), $.trimHTML(@$editor.html())]

    dispose: ->
      super

      $(window).off('click.page')
      @$el.off('dblclick')
      @active = false
      @destroyEditor()

  class Editable.TextArea extends Editor

    listenBlur: ->
      $(window).on 'click.page', (e) =>
        # Return if no @$editor exists
        return unless @$editor

        # If target is not inside body, we must be clicking a removed element
        return unless $('html')[0] is $(e.target)[0] or $('html').find(e.target).length

        # Return if we're clicking inside @$el
        return if $(e.target).closest(@$el).length

        # Return if we're clicking inside a redactor modal
        return if $(e.target).closest('#redactor_modal, .redactor_dropdown').length

        @endEdit()

    startEdit: ->
      return if not super

      html = @$el.html()
      @$editor = $('<div>').html(html)
      @$el.empty().append(@$editor)
      @$editor.redactor
        focus: true
        buttons:
          ['html', '|', 'formatting', '|', 'bold', 'italic', '|',
           'image', 'video', 'file', 'link', '|',
           'fontcolor', 'backcolor', '|', 'alignment']
        allowedTags:
          ['span', 'div', 'a', 'br', 'p', 'b', 'i', 'u', 'img', 'video',
           'audio', 'object', 'embed', 'param', 'ul', 'ol', 'li', 'hr',
           'pre', 'strong', 'em', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'iframe']

    endEdit: ->
      return if not super
      @$editor = null

    destroyEditor: ->
      return unless @$editor

      text = $.trim(@$editor.getText())
      html = $.trimHTML(@$editor.getCode())

      # Redactor#destroyEditor popuplates @$editor with the resulting html,
      # but does not trim it. So lets do that for it.
      @$editor.destroyEditor()
      @$el.html(html)

      [text, html]

  class Editable.TextInput extends Editor

    startEdit: ->
      return if not super

      @$editor = @$el.attr('contenteditable', true)
      @$el.on('keydown', @checkKey)

      @$el.focus()

    endEdit: ->
      return if not super

      @$el.off('keydown', @checkKey)
      @$editor = @$el.attr('contenteditable', false)

    destroyEditor: ->
      return unless @$editor
      [$.trim(@$editor.text()), null]

    checkKey: (e) =>
      if e.keyCode is 9 # Tab
        e.preventDefault()
        @$el.trigger('editor:next')
      else if e.keyCode is 13 # Enter
        e.stopPropagation()
        @endEdit()

    dispose: ->
      super
      @$el.off('keydown', @checkKey)

  class Editable.DateInput extends Editable.TextInput

    destroyEditor: ->
      return unless @$editor
      value = $.trim(@$editor.text())
      date = moment(value).format('YYYY-MM-DD')
      [date, null]

  return Editable
