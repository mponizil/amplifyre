define [
  'models/model'
], (Model) ->

  class Social extends Model

    defaults:
      id: null
      type: null
      link: null
