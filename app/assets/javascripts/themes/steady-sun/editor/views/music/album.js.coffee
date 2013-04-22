define [
  'quilt'
  'ui/destroy'
  'ui/fileupload'
  'ui/progress-bar'
  'ui/sortable'
  'themes/common/views/helper-view'
], (Quilt, Destroy, Fileupload, ProgressBar, Sortable, HelperView) ->

  class AlbumView extends HelperView
