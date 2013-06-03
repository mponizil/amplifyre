define [
  'themes/common/models/model'
], (Model) ->

  class Post extends Model

    name: 'post'

    label: 'post'

    defaults: ->
      created_at: (new Date()).toISOString()
      title: 'Post title...'
      body: 'Post content...'
