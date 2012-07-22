define [
  'models/collection'
  'models/page'
], (Collection, Page)

  class Pages extends Collection
    model: Page

    comparator: (page) ->
      page.get('order')