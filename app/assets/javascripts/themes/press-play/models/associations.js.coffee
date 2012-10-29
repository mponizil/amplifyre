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

  BandSite.has()
    .many('albums',
      collection: Albums
      inverse: 'band_site'
    )
    .many('tracks',
      collection: Tracks
      inverse: 'band_site'
    )
    .many('concerts',
      collection: Concerts
      inverse: 'band_site'
    )
    .many('pages',
      collection: Pages
      inverse: 'band_site'
    )
    .many('photos',
      collection: Photos
      inverse: 'band_site'
    )
    .many('posts',
      collection: Posts
      inverse: 'band_site'
    )
    .many('socials',
      collection: Socials
      inverse: 'band_site'
    )

  Album.has()
    .one('band_site',
      model: BandSite
      inverse: 'albums'
    )
    .many('tracks',
      collection: Tracks
      inverse: 'album'
    )

  Track.has()
    .one('band_site'
      model: BandSite
      inverse: 'tracks'
    )
    .one('album',
      model: Album
      inverse: 'tracks'
    )

  Concert.has()
    .one('band_site',
      model: BandSite
      inverse: 'concerts'
    )

  Page.has()
    .one('band_site',
      model: BandSite
      inverse: 'pages'
    )

  Photo.has()
    .one('band_site',
      model: BandSite
      inverse: 'photos'
    )

  Post.has()
    .one('band_site',
      model: BandSite
      inverse: 'posts'
    )

  Social.has()
    .one('band_site',
      model: BandSite
      inverse: 'socials'
    )
