define [
  'models/model'
], (Model) ->

  class Album extends Model

    defaults: ->
      cover_file:
        url: '/assets/images/album/cover_file/default.jpg'
        sm_thumb:
          url: '/assets/images/album/cover_file/sm_thumb_default.jpg'
        lrg_thumb:
          url: '/assets/images/album/cover_file/lrg_thumb_default.jpg'
