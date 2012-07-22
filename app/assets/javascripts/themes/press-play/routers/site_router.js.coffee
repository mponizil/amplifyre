class PressPlay.Routers.SiteRouter extends Backbone.Router

  initialize: (options) ->
    @data = options.data
    @m = {}
    @c = {}
    @v = {}

    @c.pages = new PressPlay.Collections.PagesCollection()
    @c.pages.reset @data.pages
    @m.page = @c.pages.get(-1)
    @c.socials = new PressPlay.Collections.SocialsCollection()
    @c.socials.reset @data.socials
    @c.tracks = new PressPlay.Collections.TracksCollection()
    @c.tracks.reset @data.tracks

    @v.navigation = new PressPlay.Views.NavigationView
      collection: @c.pages
    @v.social = new PressPlay.Views.SocialView
      collection: @c.socials
    @v.background = new PressPlay.Views.BackgroundView()
    @v.music = new PressPlay.Views.MusicView
      collection: @c.tracks
      data:
        tagline: @data.tagline

  routes:
    ""      : "index"
    "home"  : "index"
    ":slug" : "page"

  index: ->
    @m.page = @c.pages.get(-1)
    if @v.page?.destroy?()
      @v.page.destroy => @v.music.render()
    else
      @v.music.render()

  page: (slug) ->
    if @m.page is @c.pages.get(-1) then @v.music.destroy()

    pageBySlug = @c.pages.where(slug: slug)
    if pageBySlug.length > 0 then @m.page = pageBySlug[0]
    else
      @navigate("home"
        trigger: true
        replace: true
      )

    @[@m.page.get("type")]()

  custom: ->
    @v.page = new PressPlay.Views.Pages.CustomPageView
      model: @m.page
    @v.page.render()

  news: ->
    @v.page = new PressPlay.Views.Pages.NewsPageView
      model: @m.page
    @v.page.render()

  photos: ->
    @v.page = new PressPlay.Views.Pages.PhotosPageView
      model: @m.page
    @v.page.render()

  listen: ->
    @v.page = new PressPlay.Views.Pages.ListenPageView
      model: @m.page
      music: @v.music
    @v.page.render()

  tour: ->
    @v.page = new PressPlay.Views.Pages.TourPageView
      model: @m.page
    @v.page.render()

  contact: ->
    @v.page = new PressPlay.Views.Pages.ContactPageView
      model: @m.page
    @v.page.render()

  