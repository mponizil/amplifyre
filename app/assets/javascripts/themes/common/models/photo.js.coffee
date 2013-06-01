define [
  'at-common/models/model'
], (Model) ->

  class Photo extends Model

    name: 'photo'

    label: 'photo'

    defaults: ->
      file: do ->
        url: '/assets/global/dark-loader.gif'
        sm_thumb: do -> url: '/assets/global/dark-loader.gif'
        lrg_thumb: do -> url: '/assets/global/dark-loader.gif'
