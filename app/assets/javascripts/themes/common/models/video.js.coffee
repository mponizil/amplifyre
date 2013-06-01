define [
  'at-common/models/model'
], (Model) ->

  class Video extends Model

    name: 'video'

    label: 'video'

    defaults: ->
      file:
        url: '/assets/global/dark-loader.gif'
        sm_thumb: url: '/assets/global/dark-loader.gif'
