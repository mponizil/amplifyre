class PressPlay.Models.Page extends Backbone.Model
  defaults:
    id: null
    slug: null
    title: null
    data: null

class PressPlay.Collections.PagesCollection extends Backbone.Collection
  model: PressPlay.Models.Page

  comparator: (page) ->
    page.get("order")