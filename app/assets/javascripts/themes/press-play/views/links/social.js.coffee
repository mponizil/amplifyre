define [
  'quilt'
  'jst!themes/press-play/templates/links/social-item'
], (Quilt, socialJst) ->

  class SocialView extends Quilt.View

    template: -> '''<ul class='nav'></ul>'''

    render: ->
      super

      @views.push(new List
        el: @$('ul')
        view: Quilt.View.extend
          tagName: 'li'
          template: socialJst
        collection: @collection
      .render())

      @
