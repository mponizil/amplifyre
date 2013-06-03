define [
  'themes/steady-sun/views/pages/base/bare'
  'themes/common/views/forms/subscribe'
  'jst!themes/steady-sun/templates/pages/follow'
], (BarePage, SubscribeView, jst) ->

  class FollowPage extends BarePage

    template: jst

    category: 'follow'

    render: ->
      super

      @views.push(new SubscribeView
        el: @$subscribe
        model: @band_site
      .render())

      return this
