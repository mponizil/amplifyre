class PressPlay.Views.NavigationView extends Backbone.View

  el: "#navigation"

  template: JST["themes/press-play/templates/navigation"]

  initialize: ->
    @render()

  events:
    "click li" : "navigate"

  render: ->
    @$el.html(@template(pages: @collection.toJSON()))

  navigate: (e) ->
    pageId = $(e.currentTarget).data("id")
    page = @collection.get(pageId)
    if page isnt window.router.m.page
      window.router.navigate(page.get("slug"), trigger: true)