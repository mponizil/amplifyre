define [
  'themes/common/models/album'
  'patches/fileupload'
  'patches/sortable'
  'at-ss/editor/views/pages/base/main'
], (Album, Fileupload, Sortable, EditPage) ->

  class EditListenPage extends EditPage
