define [
  'editor/views/pages/base'
], (EditPageView) ->

  class ListenView extends EditPageView

    constructor: ({@player, @albums}) ->
      super

    controlsJst: -> '''
      <div class='left'>
        <input type='file' name='file' data-edit-mode data-fileupload multiple />
      </div>
      <div class='right'>
        <button class='delete' data-destroy>Delete Page</button>
      </div>
      '''
