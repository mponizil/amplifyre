define [
  'models/model'
  'moment'
], (Model, moment) ->

  class Post extends Model

    defaults: ->
      created_at: +new Date
      title: 'New Post'
      body: 'Fill in your post content here...'
