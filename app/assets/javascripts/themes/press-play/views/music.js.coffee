define [
  'quilt'
  'jst!templates/music'
], (Quilt, jst) ->

  class MusicView extends Quilt.View

    initialize: ->
      super

      @collection.on('set:track', @setTrack, @)

    template: jst

    events:
      'click #prev': 'prev'
      'click #next': 'next'
      'click #play': 'play'
      'click #pause': 'pause'

    render: ->
      super

      @$('#play').click => @play() # some bs
      @$('#pause').click => @pause() #some bs
      @$('#play-pause, #prev, #next').hover(
        -> $(@).animate('opacity': 1)
        -> $(@).animate('opacity': 0)
      )
      @jPlayerInit()

      @

    jPlayerInit: ->
      @$('#jp_interface').jPlayer(
        ready: => @setTrack(@collection.track)
        ended: => @next()
        volume: 1
        swfPath: '/assets/jplayer'
        supplied: 'mp3, m4a'
        cssSelectorAncestor: '#play-pause'
        cssSelector:
          'play': '#play'
          'pause': '#pause'
      ).css('height', 0)

    play: ->
      @collection.trigger('play:track')

      @$('#play').animate(opacity: 0)
      @$('#pause').animate(opacity: 1)

      @$('#jp_interface').jPlayer('play')

    pause: ->
      @collection.trigger('pause:track')

      @$('#pause').animate(opacity: 0)
      @$('#play').animate(opacity: 1)

      @$('#jp_interface').jPlayer('pause')

    prev: ->
      @collection.trigger('prev:track')

    next: ->
      @collection.trigger('next:track')

    setTrack: (track) ->
      @$('#jp_interface').jPlayer 'setMedia',
        m4a: '/assets/audio/' + track.get('file') + '.m4a'
        mp3: '/assets/audio/' + track.get('file') + '.mp3'
