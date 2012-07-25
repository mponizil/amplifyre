define [
  'views/page'
  'jst!templates/pages/listen'
], (Page, jst) ->

  class ListenView extends Page

    initialize: ->
      @music = @options.music
      super

    template: jst

    events:
      "click .tracks li" : "playTrack"

    render: ->
      super

      if @music.isPlaying then @highlight @music.track.get("id")
      $(".album-cover a").fancybox
        overlayColor: '#000000'

      @

    playTrack: (e) ->
      trackId = $(e.currentTarget).data("id")
      @highlight trackId
      @music.setTrack trackId: trackId, true

    highlight: (trackId) ->
      @$(".tracks").find("li").removeClass("playing-bg")
      @$(".tracks").find("li[data-id=" + trackId + "]").addClass("playing-bg")