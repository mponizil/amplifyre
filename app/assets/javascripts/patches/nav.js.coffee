define [
  'jquery'
  'quilt'
], ($, Quilt) ->

  # Activate items based on current url.
  Quilt.patches.nav = (el, options) ->
    new Nav el: el

  class Nav extends Quilt.View

    initialize: (options) ->
      super
      @history = options?.history or Backbone.history
      @history.on('route', @route, @)

    route: ->
      _.each(@$('[data-fragment]'), @toggle, @)

    toggle: (a) ->
      $a = $(a)
      active = $a.data().fragment is @history.fragment

      $li = $a.parent('li')
      $el = if $li.length then $li else $a
      $el.toggleClass('active', active)
