define [
  'editor/views/pages/base'
  'fileupload'
], (EditPageView) ->

  class PhotosView extends EditPageView

    controlsJst: -> '''
      <div class='left'>
        <input type='file' name='file' data-edit-mode data-fileupload multiple />
      </div>

      <div class='right' data-edit-mode>
        <button class='delete' data-destroy>Delete Page</button>
      </div>
      '''
