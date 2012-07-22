class PressPlay.Views.MusicView extends Backbone.View

  el: "body"

  initialize: (options) ->
    @data = options.data
    @isPlaying = false

    @tagline = new PressPlay.Views.TaglineView
      collection: @collection
      data:
        tagline: @data.tagline

    @jPlayerInit()

  events:
    "mouseenter #play-pause" : "playPauseEnter"
    "mouseleave #play-pause" : "playPauseLeave"
    "click #prev"            : "prev"
    "click #next"            : "next"

  render: ->
    $("#play-pause").show()
    $("#next-prev").show()
    $("#play").click => @play() # for some reason can't define in events hash
    $("#pause").click => @pause() # for some reason can't define in events hash
    $("#prev, #next").hover(
      -> $(@).animate("opacity": 1)
      -> $(@).animate("opacity": 0)
    )

  destroy: ->
    $("#play-pause").hide()
    $("#next-prev").hide()
    $("#play, #pause").unbind("click")
    $("#prev, #next").unbind("mouseenter").unbind("mouseleave")

  jPlayerInit: ->
    $("#jp_interface").jPlayer(
      ready: => @setTrack track: @collection.at(0)
      ended: @next
      volume: 1
      swfPath: "/assets/jplayer"
      supplied: "mp3, m4a"
      cssSelectorAncestor: "#play-pause"
      cssSelector:
        "play": "#play"
        "pause": "#pause"
    ).css("height", 0)

  playPauseEnter: ->
    if @isPlaying
      $("#play").fadeOut()
      $("#pause").fadeIn()
    else
      $("#pause").fadeOut()
      $("#play").fadeIn()

  playPauseLeave: ->
    $("#pause").fadeOut()
    $("#play").fadeOut()

  play: ->
    @tagline.start()

    $("body").animate(
      "background-color": "#ffffff"
      , 1000, "easeOutSine")
    $("#background-desat").fadeOut(1000, "easeOutSine")

    $("#play").fadeOut()
    $("#pause").fadeIn()

    $("#jp_interface").jPlayer("play")
    @isPlaying = true

  pause: ->
    @tagline.stop()

    $("body").animate(
      "background-color": "#ffffff"
      , 1000, 'easeOutSine')
    $("#background-desat").fadeIn(1000, "easeOutSine")

    $("#pause").fadeOut()
    $("#play").fadeIn()

    $("#jp_interface").jPlayer("pause")
    @isPlaying = false

  prev: ->
    trackIndex = @collection.indexOf(@track)
    trackIndex = if --trackIndex < 0 then @collection.length - 1 else trackIndex
    track = @collection.at(trackIndex)

    @setTrack track: track, @isPlaying

  next: ->
    trackIndex = @collection.indexOf(@track)
    trackIndex = if ++trackIndex >= @collection.length then 0 else trackIndex
    track = @collection.at(trackIndex)

    @setTrack track: track, @isPlaying

  setTrack: (data, andPlay) =>
    @track = if data.track? then data.track else @collection.get(data.trackId)

    $("#jp_interface").jPlayer "setMedia",
      m4a: "/assets/audio/" + @track.get("file").m4a
      mp3: "/assets/audio/" + @track.get("file").mp3

    if andPlay
      $("#jp_interface").jPlayer("play")
      @isPlaying = true

    @tagline.update(@track, @isPlaying)