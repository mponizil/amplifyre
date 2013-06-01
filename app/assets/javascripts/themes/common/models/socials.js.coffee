define [
  'at-common/models/collection'
  'at-common/models/social'
], (Collection, Social) ->

  class Socials extends Collection

      model: -> Social.create(arguments...)
