define [
  'at-pp/models/collection'
  'at-pp/models/page'
], (Collection, Page) ->

  class Pages extends Collection

    model: -> Page.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/pages'

    name: 'pages'

    comparator: (page) -> page.get('position')

    allCategories: ['news', 'photos', 'listen', 'tour', 'contact', 'custom']
