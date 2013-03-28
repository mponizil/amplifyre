define [
  'list'
  'at-ss/views/pages/base/plain'
  'jst!at-ss/templates/pages/videos'
], (List, PlainPage, jst) ->

  class VideosPage extends PlainPage

    template: jst

    render: ->
      super
      $('.container:first').attr('id', 'videos-page')
      return this