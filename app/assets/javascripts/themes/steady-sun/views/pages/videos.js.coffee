define [
  'list'
  'themes/steady-sun/views/pages/base/bare'
  'jst!themes/steady-sun/templates/pages/videos'
], (List, BarePage, jst) ->

  class VideosPage extends BarePage

    template: jst

    category: 'videos'
