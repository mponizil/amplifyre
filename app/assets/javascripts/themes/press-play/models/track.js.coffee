class PressPlay.Models.Track extends Backbone.Model
  defaults:
    id: null
    album_id: null
    file: null
    title: null
    artist: null

class PressPlay.Collections.TracksCollection extends Backbone.Collection
  model: PressPlay.Models.Track