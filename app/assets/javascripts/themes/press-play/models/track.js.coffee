define [
  'models/model'
], (Model) ->

  class Track extends Model
    defaults:
      id: null
      album_id: null
      file: null
      title: null
      artist: null
