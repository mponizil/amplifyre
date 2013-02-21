define [
  'at-pp/views/pages/base/content-box'
  'jst!at-pp/templates/pages/custom'
], (ContentBoxPage, jst) ->

  class CustomPage extends ContentBoxPage

    template: jst
