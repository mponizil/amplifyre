define [
  'at-pp/models/collection'
  'at-pp/models/social'
], (Collection, Social) ->

  class Socials extends Collection

      model: -> Social.create(arguments...)
