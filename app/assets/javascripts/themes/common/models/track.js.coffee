define [
  'themes/common/models/model'
], (Model) ->

  class Track extends Model

    name: 'track'

    label: 'track'

    toJSON: (options) ->
      if options?.position
        return _.pick @attributes, 'id', 'album_id', 'position'
      else
        return super
