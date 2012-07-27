define [
  'quilt'
  'jst!templates/links/social-item'
], (Quilt, socialJst) ->

  class SocialView extends Quilt.View

    template: -> '<ul></ul>'

    render: ->
      super

      @views.push(new List
        el: @$('ul')
        view: Quilt.View.extend
          template: socialJst
        collection: @collection
      .render())

      @