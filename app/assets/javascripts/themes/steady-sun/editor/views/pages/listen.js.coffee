define [
  'themes/common/models/album'
  'ui/fileupload'
  'ui/sortable'
  'at-ss/editor/views/pages/base/main'
], (Album, Fileupload, Sortable, EditPage) ->

  class EditListenPage extends EditPage
