define [
  'at-ss/views/pages/base/plain'
  'themes/common/views/forms/subscribe'
  'jst!at-ss/templates/pages/follow'
], (PlainPage, SubscribeView, jst) ->

  class FollowPage extends PlainPage

    template: jst

    render: ->
      super

      $('.container:first').attr('id', 'follow-page')

      @views.push(new SubscribeView
        el: @$subscribe
        model: @band_site
      .render())

      return this
