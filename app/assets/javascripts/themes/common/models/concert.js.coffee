define [
  'themes/common/models/model'
], (Model) ->

  class Concert extends Model

    name: 'concert'

    label: 'concert date'

    defaults: ->
      date: (new Date()).toISOString()
      venue: 'Concert venue...'
      details: 'Concert details...'
      photo_file:
        url: '/assets/concert/photo_file/default.jpg'
        sm_thumb:
          url: '/assets/concert/photo_file/sm_thumb_default.jpg'
        lrg_thumb:
          url: '/assets/concert/photo_file/lrg_thumb_default.jpg'
