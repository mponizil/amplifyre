define [
  'quilt'
  'templates/social'
], (Quilt, jst) ->

  class SocialView extends Quilt.View

    template: jst

    render: ->
      @$el.html(@template(socials: @collection.toJSON()))