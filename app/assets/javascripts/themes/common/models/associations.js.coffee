define [
  'at-common/models/album'
  'at-common/models/albums'
  'at-common/models/band_site'
  'at-common/models/concert'
  'at-common/models/concerts'
  'at-common/models/page'
  'at-common/models/pages'
  'at-common/models/photo'
  'at-common/models/photos'
  'at-common/models/video'
  'at-common/models/videos'
  'at-common/models/post'
  'at-common/models/posts'
  'at-common/models/social'
  'at-common/models/socials'
  'at-common/models/track'
  'at-common/models/tracks'
], (Album, Albums, BandSite, Concert, Concerts, Page, Pages, Photo, Photos, Video, Videos, Post, Posts, Social, Socials, Track, Tracks) ->

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
    .many('videos',
      collection: Videos
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

  Video.has()
    .one('band_site',
      model: BandSite
      inverse: 'videos'
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
