define [
  'themes/common/models/collection'
  'themes/common/models/page'
], (Collection, Page) ->

  class Pages extends Collection

    model: -> Page.create(arguments...)

    url: -> super + 'band_sites/' + @owner.id + '/pages'

    name: 'pages'

    comparator: (page) -> page.get('position')

    allCategories: ['news', 'photos', 'videos', 'listen', 'tour', 'follow', 'contact', 'custom']
