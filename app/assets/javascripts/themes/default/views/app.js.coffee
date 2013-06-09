define [
  'themes/common/views/app'
  'help!themes/default/views/links/navigation'
  'themes/default/views/pages'
  'jst!themes/default/templates/app'
  'themes/default/views/patches'
], (AppView, NavigationView, PagesView, jst) ->

  class DefaultAppView extends AppView

    template: jst

    render: ->
      super

      @views.push(new NavigationView
        el: @$navigation
        collection: @pages
        router: @router
      .render())

      @views.push(new PagesView
        el: @$page
        router: @router
        band_site: @model
        player: @player
      .render())

      return this
