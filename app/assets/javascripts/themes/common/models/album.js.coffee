define [
  'themes/common/models/model'
], (Model) ->

  class Album extends Model

    name: 'album'

    label: 'album'

    isNew: ->
      super or @id is -1

    defaults: ->
      cover_file:
        url: '/assets/global/dark-loader.gif'
        sm_thumb: url: '/assets/global/dark-loader.gif'
        lrg_thumb: url: '/assets/global/dark-loader.gif'
      position: (@collection?.length + 1) or 1

    emptySingles: ->
      @id is -1 and @tracks().length is 0

    toJSON: (options) ->
      if options?.position
        return _.pick @attributes, 'id', 'position'
      else
        return super

  Album.createSingles = (attrs) ->
    singlesAttrs =
      id: -1
      title: 'Singles'
      cover_file:
        url: '/assets/album/cover_file/default.jpg'
        sm_thumb: url: '/assets/album/cover_file/sm_thumb_default.jpg'
        lrg_thumb: url: '/assets/album/cover_file/lrg_thumb_default.jpg'
      position: -1
    @create(_.defaults(attrs, singlesAttrs))

  return Album
