define [
  'themes/common/views/music/track'
  'jst!themes/default/templates/music/track'
], (BaseTrackView, jst) ->

  class TrackView extends BaseTrackView

    template: jst
