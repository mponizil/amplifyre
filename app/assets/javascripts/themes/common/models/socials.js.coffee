define [
  'themes/common/models/collection'
  'themes/common/models/social'
], (Collection, Social) ->

  class Socials extends Collection

      model: -> Social.create(arguments...)
