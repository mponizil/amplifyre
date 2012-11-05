define [
  'quilt'
], (Quilt) ->

  class TracksUploader extends Quilt.View

    template: -> '''<input type='file' name='file' data-edit-mode data-fileupload multiple />'''
