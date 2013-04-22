define [
  'quilt'
  'patches/destroy'
  'patches/fileupload'
  'patches/progress-bar'
  'patches/sortable'
  'themes/common/views/helper-view'
], (Quilt, Destroy, Fileupload, ProgressBar, Sortable, HelperView) ->

  class AlbumView extends HelperView
