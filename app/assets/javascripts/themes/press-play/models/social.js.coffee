class PressPlay.Models.Social extends Backbone.Model
  defaults:
    id: null
    type: null
    link: null

class PressPlay.Collections.SocialsCollection extends Backbone.Collection
  model: PressPlay.Models.Social