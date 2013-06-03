define [
  'list'
  'themes/steady-sun/views/pages/base/plain'
  'jst!themes/steady-sun/templates/pages/videos'
], (List, PlainPage, jst) ->

  class VideosPage extends PlainPage

    template: jst

    render: ->
      super
      $('.container:first').attr('id', 'videos-page')
      return this
