define [
  'models/model'
], (Model) ->

  class Page extends Model
    defaults:
      id: null
      slug: null
      title: null
      data: null
