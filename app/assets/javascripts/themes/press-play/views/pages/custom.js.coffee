define [
  'themes/press-play/views/pages/base/content-box'
  'jst!themes/press-play/templates/pages/custom'
], (ContentBoxPage, jst) ->

  class CustomPage extends ContentBoxPage

    template: jst
