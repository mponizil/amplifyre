class PressPlay.Views.TaglineView extends Backbone.View

  el: "#tagline"

  initialize: (options) ->
    @data = options.data
    @duration = 5000
    @tagIndex = 0

  render: (state) ->
    @$(".track-info").fadeOut =>
      if state == "stop"
        @$(".track-info").html(@data.tagline)
      else
        tagline = @track.get("title")
        artist = @track.get("artist")
        if @tagIndex % 2 == 0 then @$(".track-info").html(tagline)
        else @$(".track-info").html(artist)
      @$(".track-info").fadeIn()
      @tagIndex++

  start: ->
    @render("play")
    @interval = setInterval(
      => @render("play")
      @duration
    )

  stop: ->
    clearInterval(@interval)
    @render("stop")

  update: (track, isPlaying) ->
    @track = track
    @tagIndex = 0
    if isPlaying
      clearInterval(@interval)
      @start()