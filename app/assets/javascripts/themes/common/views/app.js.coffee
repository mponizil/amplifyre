define [
  'themes/common/views/view'
], (View) ->

  class AppView extends View

    initialize: ({@pages, @player, @router}) ->
      super
      @router.on('route', @route, @)

    events:
      'route a': 'navigate'

    navigate: (e, fragment) ->
      @router.navigate(fragment, true)
