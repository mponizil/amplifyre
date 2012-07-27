define [
  'quilt'
  'list'
  'ui/html'
  'jst!templates/pages/album'
], (Quilt, List, Html, jst) ->

  class AlbumView extends Quilt.View

    template: jst

    attributes:
      class: 'album'

    render: ->
      super

      @views.push(new List
        el: @$tracks
        view: Html.extend
          tagName: 'li'
          attributes:
            class: 'clearfix'
          attr: 'title'
          events:
            'click': 'play'
          play: ->
            @model.trigger('set', @model)
            @model.trigger('play', @model)
        collection: @model.tracks()
      .render())

      @$('[data-fancybox]').fancybox
        helpers:
          overlay:
            css:
              'background-color': '#000'

      @
