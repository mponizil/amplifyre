define [
  'models/model'
], (Model) ->

  class Post extends Model

    defaults: ->
      created_at: (new Date()).toISOString()
      title: 'Post title...'
      body: 'Post content...'
