define [
  'ui/fileupload'
  'at-ss/editor/views/pages/base'
], (Fileupload, EditPageView) ->

  class VideosView extends EditPageView

    inject: ->
      super

      @$el.append('''
        <div class='well well-small'>
          <input type='file' name='video[file]' data-ref='upload' multiple />
        </div>''')

    render: ->
      super

      @views.push(new Fileupload
        el: @$upload
        collection: @collection
      .render())

      return this