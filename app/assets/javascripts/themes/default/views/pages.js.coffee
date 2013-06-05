define [
  'themes/common/views/view'
  'themes/common/views/pages'
  'help!themes/default/views/pages/news'
  'help!themes/default/views/pages/listen'
  'help!themes/default/views/pages/photos'
  'help!themes/default/views/pages/videos'
  'help!themes/default/views/pages/tour'
  'help!themes/default/views/pages/follow'
  'help!themes/default/views/pages/contact'
  'help!themes/default/views/pages/custom'
], (View, PagesView, NewsView, ListenView, PhotosView, VideosView, TourView, FollowView, ContactView, CustomView) ->

  class DefaultPagesView extends PagesView

    index: ->
      @changePage new View

    news: (model) ->
      @changePage new NewsView
        model: model
        collection: @band_site.posts()

    listen: (model) ->
      @changePage new ListenView
        model: model
        albums: @band_site.albums()
        tracks: @band_site.tracks()
        player: @player

    photos: (model) ->
      @changePage new PhotosView
        model: model
        collection: @band_site.photos()

    videos: (model) ->
      @changePage new VideosView
        model: model
        collection: @band_site.videos()

    tour: (model) ->
      @changePage new TourView
        model: model
        collection: @band_site.concerts()

    follow: (model) ->
      @changePage new FollowView({model, @band_site})

    contact: (model) ->
      @changePage new ContactView({model, @band_site})

    custom: (model) ->
      @changePage new CustomView({model})
