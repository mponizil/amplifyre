class Amplifyre.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    content: null

class Amplifyre.Collections.PostsCollection extends Backbone.Collection
  model: Amplifyre.Models.Post
  url: '/posts'
