define [
  'themes/common/models/model'
], (Model) ->

  class Photo extends Model

    name: 'photo'

    label: 'photo'

    defaults: ->
      file:
        url: '/assets/global/dark-loader.gif'
        sm_thumb: url: '/assets/global/dark-loader.gif'
