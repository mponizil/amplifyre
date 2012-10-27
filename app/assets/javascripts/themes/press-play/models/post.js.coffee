define [
  'models/model'
  'moment'
], (Model, moment) ->

  class Post extends Model

    defaults: ->
      created_at: +new Date
      title: 'Post title...'
      body: 'Post content...'
