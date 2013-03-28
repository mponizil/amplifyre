define [
  'themes/common/models/album'
  'themes/common/models/albums'
  'themes/common/models/band_site'
  'themes/common/models/concert'
  'themes/common/models/concerts'
  'themes/common/models/page'
  'themes/common/models/pages'
  'themes/common/models/photo'
  'themes/common/models/photos'
  'themes/common/models/video'
  'themes/common/models/videos'
  'themes/common/models/post'
  'themes/common/models/posts'
  'themes/common/models/social'
  'themes/common/models/socials'
  'themes/common/models/track'
  'themes/common/models/tracks'
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
