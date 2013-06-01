define [
  'moment'
  'at-common/models/model'
], (moment, Model) ->

  class Concert extends Model

    name: 'concert'

    label: 'concert date'

    defaults: ->
      date: moment().format('YYYY-MM-DD')
      venue: 'Concert venue...'
      details: 'Concert details...'
      photo_file: do ->
        url: '/assets/concert/photo_file/default.jpg'
        sm_thumb: do ->
          url: '/assets/concert/photo_file/sm_thumb_default.jpg'
        lrg_thumb: do ->
          url: '/assets/concert/photo_file/lrg_thumb_default.jpg'
