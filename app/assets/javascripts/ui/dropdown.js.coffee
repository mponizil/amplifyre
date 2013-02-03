define [
  'quilt'
  'jquery'
], (Quilt, $) ->

  # # data-dropdown
  #
  #    <div data-dropdown>
  #      <span data-dropdown-toggle>Click Me</span>
  #      <div data-dropdown-content>
  #        ...
  #      </div>
  #    </div>
  #
  # Dropdown content can be toggled, hidden, or shown by triggering
  # "dropdown:toggle", "dropdown:hide", or "dropdown:show" on the element with
  # the "data-dropdown" attribute.

  Quilt.attributes.dropdown = (el, options) ->

    new Dropdown(el: el, listenOn: options)

  # Track the current dropdown.  Hide it when another is shown.
  current = null

  class Dropdown extends Quilt.View

    constructor: ({@listenOn}) ->
      super

    initialize: ->
      @$content = @$('[data-dropdown-content]')
      @hide()

    wantsShowing: false

    events: ->
      events =
        'dropdown:toggle': 'toggle'
        'dropdown:show': 'show'
        'dropdown:hide': 'hide'

      if not @listenOn or @listenOn is 'click'
        events['click [data-dropdown-toggle]'] = 'toggle'
      else if @listenOn is 'hover'
        events['mouseover'] = 'show'
        events['mouseout'] = 'wantsHide'

      return events

    toggle: (e) ->
      e?.stopPropagation()
      if @$content.hasClass('hide')
        @show()
      else
        @hide()
      $(document).one('click', @hide)

    wantsHide: =>
      @wantsShowing = false
      setTimeout =>
        @hide() unless @wantsShowing
      , 300

    hide: =>
      # For compat. with bootstrap
      @$el.removeClass('open')

      @$content.addClass('hide')

    show: ->
      current?.hide()
      current = this

      # For compat. with bootstrap
      @$el.addClass('open')

      @$content.removeClass('hide')
      @wantsShowing = true
