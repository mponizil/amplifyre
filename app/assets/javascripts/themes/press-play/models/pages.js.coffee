define [
  'models/collection'
  'models/page'
], (Collection, Page) ->

  class Pages extends Collection

    model: -> Page.create(arguments...)

    comparator: (page) ->
      page.get('position')

    url: -> super + 'band_sites/' + @owner.id + '/pages'

    allCategories: ['news', 'photos', 'listen', 'tour', 'contact', 'custom']
