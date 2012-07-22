class PressPlay.Views.SocialView extends Backbone.View

  el: "#social-media"

  template: JST["themes/press-play/templates/social"]

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(socials: @collection.toJSON()))