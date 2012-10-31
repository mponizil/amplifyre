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

  Quilt.attributes.dropdown = (el, options) -> new Dropdown(el: el)

  # Track the current dropdown.  Hide it when another is shown.
  current = null

  class Dropdown extends Quilt.View

    events:
      'click [data-dropdown-toggle]': 'toggle'
      'dropdown:toggle': 'toggle'
      'dropdown:show': 'show'
      'dropdown:hide': 'hide'

    initialize: ->
      @$content = @$('[data-dropdown-content]')
      @hide()

    toggle: (e) ->
      e?.stopPropagation()
      if @$content.hasClass('hidden')
        @show()
      else
        @hide()
      $(document).one('click', @hide)

    hide: =>
      @$content.addClass('hidden')

    show: ->
      current?.hide()
      current = @
      @$content.removeClass('hidden')
