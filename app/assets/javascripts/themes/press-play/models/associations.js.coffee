define [
  'models/album'
  'models/albums'
  'models/band_site'
  'models/concert'
  'models/concerts'
  'models/page'
  'models/pages'
  'models/photo'
  'models/photos'
  'models/post'
  'models/posts'
  'models/social'
  'models/socials'
  'models/track'
  'models/tracks'
], (Album, Albums, BandSite, Concert, Concerts, Page, Pages, Photo, Photos, Post, Posts, Social, Socials, Track, Tracks) ->

  Album.has()
    .many('tracks',
      collection: Tracks
      inverse: 'album'
    )

  Track.has()
    .one('album',
      model: Album
      inverse: 'tracks'
    )
