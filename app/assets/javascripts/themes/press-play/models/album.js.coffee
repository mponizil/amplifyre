define [
  'models/model'
], (Model) ->

  class Album extends Model

    name: 'album'

    label: 'album'

    isNew: ->
      super or @id is -1

    defaults: ->
      title: 'Singles'
      cover_file:
        url: '/assets/images/album/cover_file/default.jpg'
        sm_thumb:
          url: '/assets/images/album/cover_file/sm_thumb_default.jpg'
        lrg_thumb:
          url: '/assets/images/album/cover_file/lrg_thumb_default.jpg'
      position: -1

    emptySingles: ->
      @id is -1 and @tracks().length is 0

    toJSON: (options) ->
      if options?.position
        return _.pick @attributes, 'id', 'position'
      else
        return super
