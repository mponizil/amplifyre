define [
  'quilt'
  'jst!at-pp/templates/links/social-item'
], (Quilt, socialJst) ->

  class SocialView extends Quilt.View

    template: -> '''<ul class='horizontal-list'></ul>'''

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
