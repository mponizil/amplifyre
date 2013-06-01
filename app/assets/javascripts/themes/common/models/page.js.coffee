define [
  'at-common/models/model'
], (Model) ->

  class Page extends Model

    name: 'page'

    label: 'page'

    toJSON: (options) ->
      if options?.position
        return _.pick @attributes, 'id', 'position'
      else
        return super
